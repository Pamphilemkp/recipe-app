class Food < ApplicationRecord
  belongs_to :user
  has_many :recipefoods, dependent: :destroy

  has_many :recipes, through: :recipefoods

  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :measurment_unit, presence: true, length: { maximum: 250 }
  validates :price, presence: true
  validates :quanity, presence: true
end
