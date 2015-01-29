FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
  end

end
