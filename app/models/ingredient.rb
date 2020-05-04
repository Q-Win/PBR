class Ingredient < ApplicationRecord
  before_save { self.name = name.downcase }
  before_save { self.name = name.singularize }
  validates :name, presence: true, length: {maximum: 25 }
  validates_uniqueness_of :name
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
