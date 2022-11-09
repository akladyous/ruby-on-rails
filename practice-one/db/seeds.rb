lorem = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates laudantium accusantium itaque voluptate, molestiae neque optio quaerat facilis adipisci culpa aliquam ad, maiores autem ab quidem'

1.upto(5) do |n|
  email = proc { "user#{n}@email.com" }
  title = proc { "title #{n}" }
  post_content = proc { lorem.split.shuffle.join(' ') }
  User.create(email: email.call)
  Post.create(title: title.call, body: post_content.call, user_id: n)
  Blog.create(title: title.call, content: post_content.call, user_id: n)

end
