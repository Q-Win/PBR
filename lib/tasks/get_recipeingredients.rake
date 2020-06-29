namespace :import do

  task recipeingredients: :environment do

    file_name = './db/import/recipeingredients.rb'
    recipe_ingredients = RecipeIngredient.all.map do |i|
      i.name
    end

    File.write(file_name, recipe_ingredients)
  end
end
