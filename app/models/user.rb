class User < ApplicationRecord
  has_many :recipes, foreign_key: 'user_id', dependent: :destroy
  has_many :foods, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 4, maximum: 25 }
end
