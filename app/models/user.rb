class User < ApplicationRecord
  has_many :recipes, foreign_key: 'user_id', dependent: :destroy
  has_many :foods, foreign_key: 'user_id', dependent: :destroy



  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

  def recipes
    recipes.order('created_at DESC').limit(3)
  end
end
