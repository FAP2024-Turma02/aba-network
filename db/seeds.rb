if Rails.env.development?
  Comment.destroy_all
  Post.destroy_all
  User.destroy_all
  Domain.destroy_all
  Company.destroy_all
  CompanyDomain.destroy_all
  puts "Conteúdo deletado com sucesso!"
end

domain_softex = Domain.create!(
  domain_url: "softex.com"
)

softex = Company.create!(
  name: "Softex",
  cnpj: "12312312312312"
)

CompanyDomain.create!(
  company: softex,
  domain: domain_softex
)

# Users
user1 = User.create!(
  name: "Alice",
  email: "alice@softex.com",
  password: "Password123@",
  role: :user,    
  admin: false,
  company: softex
)

user2 = User.create!(
  name: "Bob",
  email: "bob@softex.com",
  password: "Password123@",
  role: :moderator,  
  admin: false,
  company: softex
)

user3 = User.create!(
  name: "Charlie",
  email: "charlie@softex.com",
  password: "Password123@",
  role: :user,   
  admin: false,
  company: softex
)

# Adicionando o usuário administrador DEUS-RICHARDO
# admin_user = User.create!(
#   name: "DEUS-RICHARDO",
#   email: "deus@softex.com",
#   password: "Password123@",
#   role: :admin,    
#   admin: true,
#   company: softex
# )

# Posts
post1 = Post.create!(content: "Este é o primeiro post.", published: true)
post2 = Post.create!(content: "Este é um post de rascunho.", published: false)
post3 = Post.create!(content: "Outro post interessante.", published: true)

# Post_user
PostUser.create!(user: user1, post: post1)
PostUser.create!(user: user1, post: post3)
PostUser.create!(user: user2, post: post1)
PostUser.create!(user: user2, post: post2)
PostUser.create!(user: user3, post: post3)

# Comments
Comment.create!(content: "Ótimo post!", user_id: user1.id, commentable: post1)
Comment.create!(content: "Concordo com esse conteúdo!", user_id: user3.id, commentable: post1)
Comment.create!(content: "Esse post precisa de mais detalhes.", user_id: user3.id, commentable: post2)
Comment.create!(content: "Adorei esse post.", user_id: user2.id, commentable: post3)

puts "Seeds criados com sucesso!"
