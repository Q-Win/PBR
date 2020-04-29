class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  belongs_to :chef
  validates :chef_id, presence: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy


  def add_ingredients(ingredient_data)
    ingredients = ingredient_data.split(",")
    ingredients.each do |ingredient|
      ingredient_components = ingredient.split("-")
      debugger
    end
  end

end
