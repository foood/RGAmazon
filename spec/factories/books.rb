FactoryGirl.define do
  factory :book do
    title "MyString"
    description "MyText"
    price 1.5
    stock 1
    category {FactoryGirl.create :category}
    author {FactoryGirl.create :author}
  end

end
