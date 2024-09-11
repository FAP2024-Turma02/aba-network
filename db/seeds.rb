User.create!(
  name: "Alice",
  email: "alice@exemplo.com",
  password: "Password123@",
  role: :user,    
  admin: false
)

User.create!(
  name: "Bob",
  email: "bob@exemplo.com",
  password: "Password123@",
  role: :moderator,  
  admin: false
)

User.create!(
  name: "Charlie",
  email: "charlie@exemplo.com",
  password: "Password123@",
  role: :user,   
  admin: false
)
