require 'rails_helper'

RSpec.describe Recipe, name: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name)}
  end
  describe 'Relationship' do
    it { should have_many(:recipe_ingredients) }
    it { should have_many(:ingredients).through(:recipe_ingredients)}
  end

end
