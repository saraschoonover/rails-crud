class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # allows us to do: @restaurant.reviews
end
