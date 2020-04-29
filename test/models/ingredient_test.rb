require 'test_helper'

class IngredientTest < ActiveSupport::TestCase

  def setup
    @ingredient = Ingredient.create(name: "carrot")
  end


  test "ingredient should be valid" do
    assert @ingredient.valid?
  end

  test "ingredient should be saved as singular" do
    @ingredient2 = Ingredient.create(name: "onions")

    assert_equal "onion", @ingredient2.name
  end

  test "ingredient should be saved as downcase" do
    @ingredient2 = Ingredient.create(name: "OniOns")

    assert_equal "onion", @ingredient2.name
  end



end
