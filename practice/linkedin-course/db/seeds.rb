# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do 
    Company.create! do |company|
        company.name = Faker::Company.name
        company.founded_on = Faker::Date.between(from: 10.years.ago, to: Date.today)
        10.times do
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