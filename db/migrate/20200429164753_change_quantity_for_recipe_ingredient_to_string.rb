class ChangeQuantityForRecipeIngredientToString < ActiveRecord::Migration[5.2]
  def change
    change_column :recipe_ingredients, :quantity, :text
  end
end
