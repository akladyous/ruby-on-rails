# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u1 = User.create(user_name: "user1", email:"user1@123.com", password:"123")

u2 = User.create(user_name: "user2", email:"user2@123.com", password:"123")

p1 = Pet.create(name: "pet one")
p2 = Pet.create(name: "pet two")

# l1 =  Listing.create(published:true, publishedAt: Time.now)
# l1.user = u1
# l1.pet = p1
# l1.save