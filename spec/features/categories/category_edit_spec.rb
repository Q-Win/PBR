require "rails_helper"

RSpec.describe "categories_edit", type: :feature do



  it "edit cat" do
    category2 = Category.create(name: "Mexican")
    visit edit_category_path(category2)

    page.fill_in 'category_name', with: 'South West'
    click_button("Edit category")
    expect(Category.last.name).to eq('south west')
  end
end
