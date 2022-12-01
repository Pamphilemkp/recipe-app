class Food < ApplicationRecord
  belongs_to :user
  has_many :recipefoods

  # validates :name, presence: true, length: { maximum: 250 }
  # validates :measurment_unit, presence: true, length: { maximum: 250 }
  # validates :price, presence: true, length: { maximum: 250 }
end
