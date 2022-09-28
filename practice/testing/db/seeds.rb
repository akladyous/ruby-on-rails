# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

content = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Porro libero nemo repudiandae non, cum, id sed perferendis ad molestiae alias aperiam neque quibusdam voluptatem ratione! Molestiae modi error quod excepturi.' * 5

1.upto(10) do |idx|
  user = User.create(email: "user#{idx}@email.com", password: '000000', password_confirmation: '000000')
  3.times do
    user.posts.create(title: "title number #{idx}", content: content.split(' ').shuffle.join(' '))
  end
end
