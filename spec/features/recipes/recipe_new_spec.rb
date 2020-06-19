require "rails_helper"

RSpec.describe "recipes_new", type: :feature do

  before(:each) do
    Recipe.delete_all
    @chef = Chef.create(name: "ted", email: "ted@bed.com",password: "password", password_confirmation: "password")
    @recipe1 = Recipe.create(name: "pasta", description: "so good", chef_id: @chef.id, instructions: "this how we do it", notes: "pay attention")
    @recipe2 = Recipe.create(name: "hummus", description: "so good", chef_id: @chef.id, instructions: "this how we do it", notes: "pay attention")
    @recipe3 = Recipe.create(name: "lentils", description: "so good", chef_id: @chef.id, instructions: "this how we do it", notes: "pay attention")
  end

  it "create new Recipe" do

    visit login_path
    fill_in :session_email, with: @chef.email
    fill_in :session_password, with: @chef.password
    click_button 'Log in'

    visit new_recipe_path

    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_content("Instructions")
    expect(page).to have_content("Notes")
    # page.fill_in 'Name', with: 'Whole Grain'
    # click_button("Add Recipe")
    # expect(Recipe.count).to eq(4)

  end
end
