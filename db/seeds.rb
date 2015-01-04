require 'faker'

User.destroy_all
Category.destroy_all
Post.destroy_all

3.times do
  User.create!(
    name: Faker::Name.name
    )
end
users = []
(User.all).each do |user|
  users << user.id
end

5.times do
  Category.create!(
    title: Faker::Lorem.word
    )
end
categories = []
(Category.all).each do |category|
  categories << category.id
end


50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(55),
    category_id: categories.sample,
    user_id: users.sample
    )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Post.count} posts created"
