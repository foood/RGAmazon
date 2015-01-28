class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :rating, format: { with: /\A[1-9]{1}\z|\A10\z/,
                    message: "only number from one to ten" }
end
