require 'faker'
Faker::Config.locale = :en


50.times do
    User.create do |user|
        user.email = Faker::Internet.email, 
        user.password = '000000'
        50.times do 
            user.profiles.new do |profile|
                
            end
        end
    end

end
50.times do
    User.new do |u|
        u.first_name = Faker::Name.first_name
        u.last_name = Faker::Name.last_name
        u.counter = rand(10)
        u.nick_name = Faker::Name.name
        u.origin = Faker::Address.country
        u.save
    end
end

50.times do 
    Category.create do |category|
        category.name = Faker::Commerce.department
        50.times do
            category.products.new do |product|
                product.name = Faker::Commerce.product_name()
                product.qty = rand(100)
                product.color = Faker::Commerce.color()
                product.price = rand(100.10...500.33).round(2)
                product.status = (0..3).entries.sample
            end
        end
    end
end

25.times do
    Teacher.create do |teacher|
        teacher.name = Faker::Name.first_name
    end
end

5.times do 
    Company.create! do |company|
        company.name = Faker::Company.name
        company.founded_on = Faker::Date.between(from: 10.years.ago, to: Date.today)
        5.times do
            company.users.new do |user|
                user.first_name = Faker::Name.first_name
                user.last_name = Faker::Name.last_name
                user.email = Faker::Internet.username(specifier: 5..10)
                user.active = [true, false].sample
                user.role = [:user, :admin].sample
            end
        end
    end
end


10.times do 
    Student.create do |student|
        student.name = Faker::Name.name
        5.times do
            student.courses.new do |course|
                course.name = Faker::Educator.subject
            end
        end
    end
end

50.times do 
    Dog.create do |dog|
        dog.name = Faker::Creature::Animal.name
    end
end