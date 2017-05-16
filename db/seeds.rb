User.create!(
  name: 'Admin User',
  password: '123qwe',
  email: 'admin@test.com',
  role: 'admin')
  
User.create!(
  name: 'Seller User',
  password: '123qwe',
  email: 'seller@test.com',
  role: 'seller')  

7.times do
  Category.create!(
    # name: Faker::LordOfTheRings.location,
    name: Faker::Superhero.name,
    description: Faker::Lorem.sentence(3, true, 4)
  )
end
categories = Category.all

50.times do
  Post.create!(
    title: Faker::Lorem.sentence(3, true, 4),
    body: Faker::Lorem.paragraph(2, true, 2),
    category:  categories.sample
  )
end
posts = Post.all
 
100.times do
  Comment.create!(
    body: Faker::Lorem.paragraph(3, true, 4),
    post: posts.sample
  )
end
 
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"