require 'rails_helper'

RSpec.describe Recipe, name: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name)}
  end
  describe 'Relationship' do
    it { should have_many(:category_recipes) }
    it { should have_many(:recipes).through(:category_recipes)}
  end

end
