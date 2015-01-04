FactoryGirl.define do
  factory :order do
    amount 1.5
    completed_date "2015-01-04 16:22:46"
    state "in progress"
    customer {FactoryGirl.create :customer}
    credit_card {FactoryGirl.create :credit_card}
  end

end
