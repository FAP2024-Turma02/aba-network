#Comment.destroy_all
#Post.destroy_all
#User.destroy_all

# User
user1 = User.create!(
  name: "Alice",
  email: "alice@exemplo.com",
  password: "Password123@",
  role: :user,    
  admin: false
)

user2 = User.create!(
  name: "Bob",
  email: "bob@exemplo.com",
  password: "Password123@",
  role: :moderator,  
  admin: false
)

user3 = User.create!(
  name: "Charlie",
  email: "charlie@exemplo.com",
  password: "Password123@",
  role: :user,   
  admin: false
)

# Post
post1 = Post.create!(content: "Este é o primeiro post.", published: true)
post2 = Post.create!(content: "Este é um post de rascunho.", published: false)
post3 = Post.create!(content: "Outro post interessante.", published: true)

#Post_user
PostUser.create!(user: user1, post: post1)
PostUser.create!(user: user1, post: post3)
PostUser.create!(user: user2, post: post1)
PostUser.create!(user: user2, post: post2)
PostUser.create!(user: user3, post: post3)


# Comment.create!(content: "Ótimo post!", user_id: user1.id, commentable: post1)
# Comment.create!(content: "Concordo com esse conteúdo!", user_id: user3.id, commentable: post1)
# Comment.create!(content: "Esse post precisa de mais detalhes.", user_id: user3.id, commentable: post2)


# Comment.create!(content: "Adorei esse post.", user_id: user2.id, commentable: post3)

puts "Seeds criados com sucesso!"
