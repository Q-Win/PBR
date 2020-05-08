class CreateCategoryRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_recipes do |t|
      t.references :categories, foreign_key: true
      t.references :recipes, foreign_key: true
    end
  end
end
