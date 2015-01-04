FactoryGirl.define do
  factory :credit_card do
    number { Faker::Business.credit_card_number }
    ccv 123
    expiration_month 12
    expiration_year 2016
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    customer {FactoryGirl.create :customer}
  end

end
