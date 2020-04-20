require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(name: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.create(name: "vegetable", description: "great vegetable recipe")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
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

end
