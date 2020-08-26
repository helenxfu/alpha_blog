# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::UniqueGenerator.clear # Clears used values for all generators

# create admin
User.create!(username: "Admin User",
             email: "admin@test.test",
             password: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# create seed users
20.times do |n|
  username = Faker::Name.unique.name[0..24]
  email = Faker::Internet.unique.email
  password = "password"
  User.create!(username: username, email: email, password: password, activated: true, activated_at: Time.zone.now)
end

# create seed categories
15.times do
  category = Faker::Educator.unique.subject[0..24]
  Category.create!(name: category)
end

users = User.order(:created_at).take(4)
# create seed articles
users.each do |user|
  15.times do
    title = Faker::Lorem.characters(number: rand(3..100)) # min: 3 max: 100 length
    description = Faker::Lorem.paragraph(sentence_count: rand(1..4))[0..299] # randomly 1~4 sentences, up to length of 300
    category_ids = (1..15).to_a.sample(rand(5)) # up to 4 categories
    user.articles.create!(title: title, description: description, category_ids: category_ids)
  end
end

# create seed microposts
users.each do |user|
  50.times do
    content = Faker::Lorem.sentence(word_count: rand(1..5))
    user.microposts.create!(content: content)
  end
end
