require 'test_helper'

class ChefsShowTest < ActionDispatch::IntegrationTest

  def setup
    @user = Chef.create(name: "Bob", email: "Bob@Robert.com",
                        password: "password", password_confirmation: "password")
    @recipe = Recipe.create(name: "vegetable saute", description: "great vegetable sautee", chef: @user)
    @recipe2 = @user.recipes.create(name: "chana masala", description: "chick peas")
  end

  test "should get chefs show" do
    get chef_path(@user)
    assert_template 'chefs/show'
    assert_select "a[href=?]",recipe_path(@recipe), text: @recipe.name
    assert_select "a[href=?]",recipe_path(@recipe2), text: @recipe2.name
    assert_match @recipe.description, response.body
    assert_match @recipe2.description, response.body
    assert_match @user.name, response.body
  end

end
