require 'rails_helper'

RSpec.describe Category, name: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name)}
  end
  describe 'Relationship' do
    xit { should have_many(:category_recipes) }
    xit { should have_many(:recipes).through(:category_recipes)}
  end

end
