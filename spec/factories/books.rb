FactoryGirl.define do
  factory :book do
    title {Faker::App.name}
    description {Faker::Lorem.paragraph}
    price 1.5
    stock 10
  end

end
