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
  ['1035 W Lake St, Chicago, IL 60607', 41.885291, -87.653566, seed_image('chicago-1148-w') ],
  ['927 W Blackhawk St, Chicago, IL 60642', 41.907910, -87.652013, seed_image('grand-161-e2') ],
  ['2345 S Michigan Ave, Chicago, IL 60616', 41.849843, -87.623251, seed_image('grove-2210-s2') ],
  ['730 W Lake St, Chicago, IL 60661', 41.885973, -87.646894, seed_image('halsted-150-n') ],
  ['809 N Racine Ave, Chicago, IL 60642', 41.896460, -87.657296, seed_image('img_0351') ]
]

tank_data2 = [
  ['527 S Wells St, Chicago, IL 60607', 41.875204, -87.633310, seed_image('img_1843') ],
  ['1500 N Halsted St, Chicago, IL 60642', 41.908752, -87.648479, seed_image('img_7534') ],
  ['1882 S Normal Ave, Chicago, IL 60616', 41.852308, -87.626711, seed_image('img_9645') ],
  ['2210 S Grove St, Chicago, IL 60616', 41.852435, -87.639727, seed_image('img_45361') ],
  ['509 N Union Ave, Chicago, IL 60654', 41.891640, -87.645550, seed_image('img_0717') ]
]

tank_data1.each do |tank|
  tank_location = sample_user1.tank_locations.build(address: tank[0], latitude: tank[1] , longitude: tank[2])
  photo = sample_user1.photos.build(image: tank[3])
  tank_location.photos << photo
  tank_location.photos.first.user_id = sample_user1.id

  tank_location.save!
  photo.save!
end


tank_data2.each do |tank|
  tank_location = sample_user2.tank_locations.build(address: tank[0], latitude: tank[1] , longitude: tank[2])
  photo = sample_user2.photos.build(image: tank[3])
  tank_location.photos << photo
  tank_location.photos.first.user_id = sample_user2.id

  tank_location.save!
  photo.save!
end
