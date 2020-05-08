require "rails_helper"

RSpec.describe "categories_show", type: :feature do

  before(:each) do
    @category1 = Category.create(name: "Oil Free")
    @category2 = Category.create(name: "Mexican")
    @category3 = Category.create(name: "Italian")
  end

  it "displays category show" do
    visit category_path(@category2)

    expect(page).to have_content(@category2.name)
  end
end
