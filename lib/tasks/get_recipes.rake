namespace :import do

  task recipes: :environment do

    file_name = './db/import/recipes.rb'
    recipes = Recipe.all.map do |r|
      {name: r.name, description: r.description, instructions: r.instructions, notes: r.notes}
    end

    File.write(file_name, recipes)
  end
end
