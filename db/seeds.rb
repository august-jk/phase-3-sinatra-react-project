require 'faker'
puts "🌱 Seeding spices..."

# Seed your database here
15.times do
    # create a game with random data
    Game.create(
      title: Faker::Game.title,
      genre: Faker::Game.genre,
      platform: Faker::Game.platform,
      price: rand(0..60) # random number between 0 and 60
    )
  end

30.times do 
    Review.create(
        name: Faker::Review.name,
        score: rand(0..10),
        comment: Faker::Lorem.sentences(number: 1..3)
    )

puts "✅ Done seeding!"
