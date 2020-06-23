class AddDisplayNameToRecipeIngredient < ActiveRecord::Migration[5.2]
  def change
      add_column :recipe_ingredients, :display_name, :text
  end
end
