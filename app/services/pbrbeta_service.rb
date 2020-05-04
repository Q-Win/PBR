class PbrbetaService

  def recipe_data
    get_json("/api/v1/recipes")
  end

  def add_recipes_to_database
    recipes = recipe_data

    recipes.each do |r|
      recipe = Recipe.create(name: r[:name], description: "please fill this out",chef_id: 2, instructions: r[:directions])
      recipe.add_ingredients_from_string(r[:ingredients])
    end
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
      Faraday.new(url: 'https://pbrbeta.herokuapp.com')
  end

end
