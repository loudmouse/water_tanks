FactoryBot.define do
  factory :photo do
    # tank_location { FactoryBot.create(:tank_location) }
    # user { FactoryBot.create(:user) }
    image_file_name "chi_water_tank.jpg"
    image_content_type "image/jpeg"
    image_file_size 36256
  end
end
