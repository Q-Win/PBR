require "rails_helper"

RSpec.describe "recipes_new", type: :feature do

  before(:each) do
    Recipe.delete_all
    @chef = Chef.create(name: "ted", email: "ted@bed.com",password: "password", password_confirmation: "password")
    @recipe1 = Recipe.create(name: "pasta", description: "so good", chef_id: @chef.id, instructions: "this how we do it", notes: "pay attention")
    @recipe2 = Recipe.create(name: "Mexican")
    @recipe3 = Recipe.create(name: "Italian")
  end

  it "create new Recipe" do
    visit new_recipe_path

    expect(page).to have_content("Name")
    page.fill_in 'Name', with: 'Whole Grain'
    click_button("Add Recipe")
    expect(Recipe.count).to eq(4)

  end
end
