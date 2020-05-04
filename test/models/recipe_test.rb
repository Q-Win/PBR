require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(name: "bob", email: "bob@example.com",
        password: "password", password_confirmation: "password")
    @recipe = @chef.recipes.create(name: "vegetable", description: "great vegetable recipe")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end

  test "recipe without chef should be invalid" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end

  test "description should NOT be less than 5 characters" do
    @recipe.description = "aaa"
    assert_not @recipe.valid?
  end

  test "description should NOT be more than 500 characters" do
    @recipe.description = "a"*501
    assert_not @recipe.valid?
  end

  test "can add ingredients to recipe from a properly formatted string" do
    @ingredient = @recipe.ingredients.create(name: "Carrots")
    assert_equal @recipe.ingredients.count, 1
    ingredient_data = "1/2 cups Carrots,0.5 cups Onions,2 Cups Chick Peas"

    @recipe.add_ingredients_from_string(ingredient_data)
    
    assert_equal @recipe.ingredients.count, 3
    assert_equal @recipe.recipe_ingredients[1].unit, "cup"
    assert_equal @recipe.recipe_ingredients[0].quantity, "1/2"
  end


end
