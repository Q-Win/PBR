require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @user = Chef.create(name: "Bob", email: "Bob@Robert.com")
    @recipe = Recipe.create(name: "vegetable saute", description: "great vegetable sautee", chef: @user)
    @recipe2 = @user.recipes.create(name: "chana masala", description: "chick peas")
  end

  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end

  test "Should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_select "a[href=?]",recipe_path(@recipe), text: @recipe.name
    assert_select "a[href=?]",recipe_path(@recipe2), text: @recipe2.name
  end

  test "should get recipes show" do
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_match @recipe.name, response.body
    assert_match @recipe.description, response.body
    assert_match @user.name, response.body
  end

  test "create new valid recipe" do
    get new_recipe_path
  end

  test "reject invalid submissions" do
    get new_recipe_path
    assert_template 'recipes/new'
  end

end
