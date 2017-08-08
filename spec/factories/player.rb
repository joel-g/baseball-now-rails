FactoryGirl.define do
  factory :player do
    name { Faker::Name.name }
    location { Faker::Pokemon.location }
    pitches_faced {10 + rand(20)}
    hits { rand(10) }
    innings { rand(3..9) }
    date { Date.today }
  end
end
