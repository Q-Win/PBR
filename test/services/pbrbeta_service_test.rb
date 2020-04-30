require 'test_helper'
require './app/services/pbrbeta_service'

class PbrbetaServiceTest < ActionDispatch::IntegrationTest

  def setup

  end

  test "it can get a JSON" do
    pbrbeta_service = PbrbetaService.new
    recipes = pbrbeta_service.recipe_data
    debugger
  end

end
