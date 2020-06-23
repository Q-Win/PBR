class RecipeIngredient < ApplicationRecord

  belongs_to :ingredient
  belongs_to :recipe

  after_save do |ri|
    if ri.display_name == nil
      ri.display_name = Ingredient.find(ri.ingredient_id).name
    end
  end

end
