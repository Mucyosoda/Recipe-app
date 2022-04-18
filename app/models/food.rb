class Food < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods, foreign_key: 'food_id', dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4, maximum: 50 }
  validates :measurement_unit, presence: true
  validates :price, presence: true, comparison: { greater_than: 0 }
end
