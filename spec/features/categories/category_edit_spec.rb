require "rails_helper"

RSpec.describe "categories_edit", type: :feature do

  before(:each) do
    @category1 = Category.create(name: "Oil Free")
    @category2 = Category.create(name: "Mexicann")
    @category3 = Category.create(name: "Italian")
  end

  it "edit cat" do
    visit edit_category_path(@category2)

    expect(page).to have_content("Mexicann")
    page.fill_in 'Name', with: 'Mexican'
    click_button("Edit category")
    expect(@category2.name).to eq('Mexican')
  end
end
