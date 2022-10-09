require 'faker'
Faker::Config.locale = :en

1.upto(50) do |idx|
  User.create do |user|
    first_name = Faker::Name.unique.first_name
    last_name = Faker::Name.unique.last_name
    email = Faker::Internet.unique.email
    status = -> { [true, false].sample }.call
    user.first_name = first_name
    user.last_name = last_name
    user.status = status
    user.email = email
    user.save
  end
end

User.all.each do |user|
  user.build_address do |address|
    address.street = Faker::Address.street_address
    address.city = Faker::Address.city
    address.zip = Faker::Address.zip.split('-').first
    address.state = Faker::Address.state
    address.save
  end
end

User.all.each do |user|
  total_urls = rand(2..5)
  1.upto(total_urls) do
    user.photos.new do |photo|
      url = Faker::Internet.unique.url
      photo.url = url
      photo.save
    end
  end
end

1.upto(100) do
  Comment.new do |comment|
    user = -> { User.ids.sample }
    photo = -> { Photo.ids.sample }
    content = Faker::Lorem.unique.paragraph(sentence_count: 5)
    comment.user_id = user.call
    comment.photo_id = photo.call
    comment.content = content
    comment.save
  end
end

1.upto(15) do
  Department.new do |dep|
    department = Faker::Commerce.department(max: 1)
    dep.name = department
    dep.save
  end
end

1.upto(100) do
  Product.new do |product|
    department = -> { Department.pluck(:name).shuffle.sample }
    name = Faker::Commerce.unique.product_name
    price = -> { rand(10.01..100.00).round(2) }
    weight = -> { rand(1..200) }
    avaliable = -> { [true, false].sample }
    quantity = -> { rand(0..100) }
    product.name = name
    product.price = price.call
    product.weight = weight.call
    product.avaliable = avaliable.call
    product.quantity = quantity.call
    product.department = department.call
    product.save
  end
end

1.upto(200) do
  Order.new do |order|
    product_id = -> { Product.pluck(:id).sample }
    user_id = -> { User.pluck(:id).sample }
    paid = -> { [true, false].sample }
    purchased_at = -> { Date.today-rand(300) }
    order.product_id = product_id.call
    order.user_id = user_id.call
    order.paid = paid.call
    order.purchased_at = purchased_at.call
    order.save
  end
end


