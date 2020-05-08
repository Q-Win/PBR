require "rails_helper"

RSpec.describe "categories_show", type: :feature do

  before(:each) do
    @category1 = Category.create(name: "Oil Free")
    @category2 = Category.create(name: "Mexican")
    @category3 = Category.create(name: "Italian")
  end

  it "displays category show" do
    visit new_category_path

    expect(page).to have_content("Name")
  end
end
