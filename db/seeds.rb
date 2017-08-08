30.times do
  Player.create(
    name: Faker::Name.name,
    location: Faker::Pokemon.location,
    pitches_faced: rand(10..20),
    hits: rand(0..3),
    innings: rand(5..9),
    date: Date.today)
end
