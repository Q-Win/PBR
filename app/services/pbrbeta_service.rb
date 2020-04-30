class PbrbetaService

  def recipe_data
    get_json("/api/v1/recipes")
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
