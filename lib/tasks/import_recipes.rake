namespace :import do

  task recipes: :environment do

    file_name = './db/import/imported_recipes.rb'
    recipes = File.new(file_name,'r').read.strip.split("{")
    debugger

  end
end
