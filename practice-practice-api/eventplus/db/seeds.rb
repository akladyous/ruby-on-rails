puts "🌱 Seeding spices..."

# Seed your database here

50.times do
    user = User.create(name: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
    user.profile.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name ,
        home_phome: Faker::PhoneNumber.phone_number,
        cell_phone: Faker::PhoneNumber.cell_phone,
        job_title: Faker::Job.title,
        comany: Faker::Company.name,
        website: Faker::Internet.url,
        blog: Faker::Internet.url(host: 'blog.com')
    )
    user.addresses.create(
        address: Faker::Address.street_address,
        address_2: Faker::Address.secondary_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip: Faker::Address.zip,
        country: Faker::Address.country_name_to_code(name: 'united_states'),

    )
end


# Category.create(category: Faker::Lorem.sentence(word_count: 5))

u1.categories << c1
puts "✅ Done seeding!"
