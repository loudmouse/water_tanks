FactoryBot.define do
  factory :tank_location do
    user { FactoryBot.create(:user) }
    address { Faker::Address.full_address }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
    neighborhood { Faker::Address.community }
    photo { FactoryBot.create(:photo) }
  end
end
