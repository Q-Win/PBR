class Category < ApplicationRecord
  validates :name, presence: true
  has_many :category_recipes
  has_many :recipes, through: :category_recipes
end
