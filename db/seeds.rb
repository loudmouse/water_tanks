# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sample_user1 = User.create!(email: "test1@sample.com", password: "123456")
sample_user2 = User.create!(email: "test2@sample.com", password: "123456")

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

tank_data1 = [
  ['1035 West Lake Street', seed_image('chicago-1148-w') ],
  ['927 West Blackhawk Street', seed_image('grand-161-e2') ],
  ['2345 South Michigan Avenue', seed_image('grove-2210-s2') ],
  ['730 West Lake Street', seed_image('halsted-150-n') ],
  ['809 North Racine', seed_image('img_0351') ],
  ['509 North Union Avenue', seed_image('img_0717') ]
]

tank_data2 = [
  ['527 South Wells', seed_image('img_1843') ],
  ['811-813 N Racine', seed_image('img_6587') ],
  ['161 East Grand Avenue ', seed_image('img_6965') ],
  ['1500 North Halsted Street', seed_image('img_7534') ],
  ['1882 South Normal Avenue', seed_image('img_9645') ],
  ['2210 South Grove Street', seed_image('img_45361') ]
]

tank_data1.each do |tank|
  tank_location = sample_user1.tank_locations.build(address: tank[0])
  photo = sample_user1.photos.build(image: tank[1])
  tank_location.photos << photo
  tank_location.photos.first.user_id = sample_user1.id

  tank_location.save!
  photo.save!
end


tank_data2.each do |tank|
  tank_location = sample_user2.tank_locations.build(address: tank[0])
  photo = sample_user2.photos.build(image: tank[1])
  tank_location.photos << photo
  tank_location.photos.first.user_id = sample_user2.id

  tank_location.save!
  photo.save!
end
