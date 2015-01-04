FactoryGirl.define do
  factory :rating do
    review "MyText"
rating Random.rand(1..10)
customer {FactoryGirl.create :customer}
book {FactoryGirl.create :book}
  end

end
