User.create!(
  name: 'Admin User',
  password: '123qwe',
  email: 'admin@test.com',
  role: 'admin',
  confirmed_at: DateTime.now
)
User.create!(
  name: 'Seller User',
  password: '123qwe',
  email: 'seller@test.com',
  role: 'seller',
  confirmed_at: DateTime.now
)
User.create!(
  name: 'Standard User',
  password: 'password',
  email: 'standard@test.com',
  role: 'standard',
  confirmed_at: DateTime.now
)  
20.times do
  User.create!(
    name: Faker::Name.name,
    password: "password",
    email: Faker::Internet.email,
    role: 'standard',
    confirmed_at: DateTime.now
  )
end
users = User.all  

4.times do
  Category.create!(
    name: Faker::Superhero.name,
    description: Faker::Lorem.sentence(3, true, 4)
  )
end
categories = Category.all

50.times do
  Post.create!(
    body: Faker::Lorem.paragraph(3, true, 3),
    category: categories.sample,
    user: users.sample
  )
end
posts = Post.all
 
300.times do
  Comment.create!(
    body: Faker::Lorem.paragraph(5, true, 4),
    post: posts.sample,
    user: users.sample
  )
end
 
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"