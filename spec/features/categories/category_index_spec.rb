require "rails_helper"

RSpec.describe "categories_index", type: :feature do

  before(:each) do
    @category1 = Category.create(name: "Oil Free")
    @category1 = Category.create(name: "Mexican")
    @category1 = Category.create(name: "Italian")
  end

  it "displays all categories on the index" do
    visit categories_path

    expect(page).to have_content(@recipe1.name)
    expect(page).to have_content(@recipe3.name)
    expect(page).to have_content(@recipe2.name)
  end
end
