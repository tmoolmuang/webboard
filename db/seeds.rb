50.times do
  Post.create!(
    title: Faker::Lorem.sentence(3, true, 4),
    body: Faker::Lorem.paragraph(2, true, 2),
  )
end
posts = Post.all
 
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph(3, true, 4),
  )
end
 
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"