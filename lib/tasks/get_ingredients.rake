namespace :import do

  task ingredients: :environment do

    file_name = './db/import/ingredients.rb'
    ingredients = Ingredient.all

  end
end
