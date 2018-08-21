FactoryBot.define do
  factory :photo do
    image_file_name "chi_water_tank.jpg"
    image_content_type "image/jpeg"
    image_file_size 36256
    user
    tank_location

    # after :create do
    #   association :user, factory: :user
    #   association :tank_location, factory: :tank_location
    # end

  end
end
