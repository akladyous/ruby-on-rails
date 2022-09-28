spinner = Enumerator.new do |e|
    loop do
        e.yield '|'
        e.yield '/'
        e.yield '-'
        e.yield '\\'
    end
end

puts "🌱 Seeding Users..."

1.upto(250) do |i|
    progress = "=" * (i/5) unless i < 5
    printf("\rGenerating user records: %s", spinner.next)
    # printf("\rGenerating user records: [%-20s] %d%%", progress, i)
    user = User.create(user_name: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
    user.create_user_profile(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name ,
        home_phone: Faker::PhoneNumber.phone_number,
        cell_phone: Faker::PhoneNumber.cell_phone,
        job_title: Faker::Job.title,
        company: Faker::Company.name,
        website: Faker::Internet.url,
        blog: Faker::Internet.url(host: 'blog.com')
    )
    user.user_profile.user_addresses.create(
        address: Faker::Address.street_address,
        address_2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip: Faker::Address.zip,
        country: Faker::Address.country_name_to_code(name: 'united_states'),

    )
end
$stdout.flush
printf("\r\n")
puts "✅ Done seeding!"
