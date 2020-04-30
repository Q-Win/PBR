require 'test_helper'
require './app/services/pbrbeta_service'

class PbrbetaServiceTest < ActionDispatch::IntegrationTest

  def setup

  end

  test "it can get a JSON" do
    pbrbeta_service = PbrbetaService.new
    recipes = pbrbeta_service.recipe_data

    assert_not_nil recipes
    assert_equal recipes[0][:name],"Minestrone"
    assert recipes, Array 
  end

end
