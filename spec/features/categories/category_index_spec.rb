require "rails_helper"

RSpec.describe "categories_index", type: :feature do

  before(:each) do
    @category1 = Category.create(name: "Oil Free")
    @category2 = Category.create(name: "Mexican")
    @category3 = Category.create(name: "Italian")
  end

  it "displays all categories on the index" do
    visit categories_path

    expect(page).to have_content(@category1.name)
    expect(page).to have_content(@category3.name)
    expect(page).to have_content(@category2.name)
  end
end
