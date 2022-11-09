1.upto(5) do |n|
  User.create do |user|
    user.email = "user#{n}@email.com"
    user.save
    user.posts.create title: "title #{n}", content: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates laudantium accusantium itaque voluptate, molestiae neque optio quaerat facilis adipisci culpa aliquam ad, maiores autem ab quidem. Quis repudiandae voluptates possimus!"
  end
end
