class DropCategoriesRecipesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :category_recipes
  end
end
