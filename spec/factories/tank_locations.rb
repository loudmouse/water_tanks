FactoryBot.define do
  factory :tank_location do
    address { Faker::Address.full_address }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
    neighborhood { Faker::Address.community }
    user
    photo

    # after :create do
    #   association :user, factory: :user
    #   association :photo, factory: :photo
    # end

  end
end
