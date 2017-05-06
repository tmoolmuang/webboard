5.times do
  Category.create!(
     name: Faker::LordOfTheRings.location,
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
puts "#{Category.count} categories created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"