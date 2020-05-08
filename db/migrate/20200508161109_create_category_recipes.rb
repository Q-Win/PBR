class CreateCategoryRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_recipes do |t|
      t.integer :recipe_id
      t.integer :category_id
    end
  end
end
