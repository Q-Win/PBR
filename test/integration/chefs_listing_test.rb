require 'test_helper'

class ChefsShowTest < ActionDispatch::IntegrationTest

  def setup
    @user = Chef.create(name: "Bob", email: "Bob@Robert.com",
                        password: "password", password_confirmation: "password")
    @recipe = Recipe.create(name: "vegetable saute", description: "great vegetable sautee", chef: @user)
    @recipe2 = @user.recipes.create(name: "chana masala", description: "chick peas")
  end

  test "should delete chef" do
    get chefs_path
    assert_template 'chefs/index'
    assert_difference 'Chef.count', -1 do
      delete chef_path(@user)
    end
    assert_redirected_to chefs_path
    assert_not flash.empty?
  end



end
