FactoryGirl.define do
  factory :credit_card do
    number { Faker::Business.credit_card_number }
    ccv 123
    expiration_month 12
    expiration_year 2016
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
  end

end
