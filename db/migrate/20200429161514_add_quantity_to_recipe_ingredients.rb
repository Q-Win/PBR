class AddQuantityToRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_ingredients, :quantity, :float
  end
end
