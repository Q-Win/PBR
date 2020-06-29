namespace :import do

  task recipeingredients: :environment do

    file_name = './db/import/recipeingredients.rb'
    recipe_ingredients = RecipeIngredient.all.map do |ri|
      recipe_name = Recipe.find(ri.recipe_id).name
      ingredient_name = Ingredient.find(ri.ingredient_id).name
      {rname: recipe_name, iname: ingredient_name, display_name: ri.display_name, quantity: ri.quantity, unit: ri.unit}
    end

    File.write(file_name, recipe_ingredients)
  end
end
