# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sample_user1 = User.create!(email: "test1@sample.com", password: "123456", user_name: "test1", admin: true)
sample_user2 = User.create!(email: "test2@sample.com", password: "123456", user_name: "test2", admin: false)

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

tank_data1 = [
  ['509 N Union Ave, Chicago, IL 60654', "West Town", 41.8916398, -87.6455495, seed_image('salvation_army') ],
  ['226 N Clinton St, Chicago, IL 60661', "West Loop", 41.8862037371435, -87.6416934711639, seed_image('river_bridge') ],
  ['400 N State St, Chicago, IL 60654', "River North", 41.889425, -87.6282785, seed_image('blackhawks') ],
  ['839 W Lake St, Chicago, IL 60607', "West Loop", 41.8853867, -87.6489632, seed_image('bridgford') ],
  ['927 W Blackhawk St, Chicago, IL 60642', "River North", 41.896460, -87.657296, seed_image('carbit-sunset') ]
]

tank_data2 = [
  ['5211 N Clark St, Chicago, IL 60640', "Andersonville", 41.9766451, -87.668015, seed_image('andersonville') ],
  ['420 N May St, Chicago, IL 60642', "West Town", 41.8894813737506, -87.6559645271514, seed_image('bird_tower') ],
  ['730 W Lake St, Chicago, IL 60661', "West Loop", 41.8859726, -87.6468937, seed_image('east_bank_storage') ],
  ['37 N Carpenter St, Chicago, IL 60607', "West Loop", 41.8827976, -87.6529493, seed_image('harpo') ],
  ['401 N Morgan St, Chicago, IL 60642', "West Town", 41.88944, -87.6517161, seed_image('graffiti') ]
]

tank_data1.each do |tank|
  tank_location = sample_user1.tank_locations.build(address: tank[0], neighborhood: tank[1], latitude: tank[2] , longitude: tank[3])
  photo = sample_user1.photos.build(image: tank[4])
  tank_location.photos << photo
  tank_location.photos.first.user_id = sample_user1.id

  tank_location.save!
  photo.save!
end


tank_data2.each do |tank|
  tank_location = sample_user2.tank_locations.build(address: tank[0], neighborhood: tank[1], latitude: tank[2] , longitude: tank[3])
  photo = sample_user2.photos.build(image: tank[4])
  tank_location.photos << photo
  tank_location.photos.first.user_id = sample_user2.id

  tank_location.save!
  photo.save!
end
