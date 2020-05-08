class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 5, maximum: 500}
  validates_uniqueness_of :name
  belongs_to :chef
  validates :chef_id, presence: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments, dependent: :destroy
  has_many :category_recipes
  has_many :categories, through: :category_recipes


  def add_ingredients_from_string(ingredient_data)
    ingredients = ingredient_data.split(",")
    ingredients.each do |ingredient|
      ingredient_components = ingredient.split(" ")
      name = ingredient_components[2..-1].join(" ").downcase.singularize
      quantity = ingredient_components[0]
      unit = ingredient_components[1].downcase.singularize
      if Ingredient.find_by(name: name) == nil
        Ingredient.create(name: name)
      end

      id = Ingredient.find_by(name: name).id
      RecipeIngredient.create(recipe_id: self.id, ingredient_id: id, quantity: quantity, unit: unit)
    end
  end

end
