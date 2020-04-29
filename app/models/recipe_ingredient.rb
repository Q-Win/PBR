class RecipeIngredient < ApplicationRecord
  before_save { self.unit = unit.downcase }
  belongs_to :ingredient
  belongs_to :recipe

end
