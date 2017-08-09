30.times do
  Player.create(
    name: Faker::Name.name,
    location: Faker::Pokemon.location,
    pitches_faced: rand(10..40),
    hits: rand(0..6),
    innings: rand(5..9),
    date: Date.today)
end
