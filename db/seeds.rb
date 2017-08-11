30.times do
  Player.create(
    name: Faker::Name.name,
    location: Faker::Pokemon.location,
    pitches_faced: rand(15..50),
    hits: rand(0..6),
    innings: rand(5..9),
    date: Date.today)
end
