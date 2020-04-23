require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = Chef.create(name: "Bob", email: "Bob@Robert.com",
                password: "password", password_confirmation: "password")
  end

  test "reject an invalid edit" do
    get edit_chef_path(@user)
    assert_template 'chefs/edit'
    patch chef_path, params: { chef: {name: " ", email: "bob@example.com"} }
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  # test "accept valid edit" do
  #   get edit_chef_path(@user)
  #   assert_template 'chefs/edit'
  #   patch chef_path, params: { chef: {name: "Bobby", email: "bob@example.com"} }
  #   assert_redirected_to @user
  #   assert_select 'h1.panel-title'
  #   assert_select 'div.panel-body'
  #   assert_not flash.empty?
  #   @user.reload
  #   assert_match "Bobby", @user.name
  #   assert_match "bob@example.com", @user.email
  # end
end
