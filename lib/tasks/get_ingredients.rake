namespace :import do

  task ingredients: :environment do

    file_name = './db/import/ingredients.rb'
    ingredients = Ingredient.all

    File.write(file_name, ingredients)
  end
end
