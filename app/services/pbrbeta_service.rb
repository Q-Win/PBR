class PbrbetaService

  def recipe_data
    get_json("/api/v1/recipes")
  end

  def add_recipes_to_database(user_id)
    recipes = recipe_data

    recipes.each do |r|
      recipe = Recipe.create(name: r[:name], description: "please fill this out",chef_id: user_id, instructions: r[:directions], notes: r[:notes])
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
