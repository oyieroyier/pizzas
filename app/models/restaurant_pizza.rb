class RestaurantPizza < ApplicationRecord
  validates :price,
            inclusion: {
              in: (1..30).to_a,
              message: 'Price must be between 1 and 30',
            }

  belongs_to :pizza
  belongs_to :restaurant
end
