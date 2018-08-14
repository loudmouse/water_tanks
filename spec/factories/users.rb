FactoryBot.define do
  factory :user do
    user_name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
