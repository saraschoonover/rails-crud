class Review < ApplicationRecord
  belongs_to :restaurant
  # allows us to do: @review.restaurant
  validates :content, presence: true
end
