namespace :import do

  task recipes: :environment do

    file_name = './db/import/recipes.rb'
    recipes = Recipe.all.map do |r|
      r.name
    end

    File.write(file_name, recipes)
  end
end
