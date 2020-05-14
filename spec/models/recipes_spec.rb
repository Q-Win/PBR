require 'rails_helper'

RSpec.describe Recipe, name: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name)}
  end
  describe 'Relationship' do
    it { should have_many(:recipe_ingredients) }
    it { should have_many(:ingredients).through(:recipe_ingredients)}
  end

  before(:each) do
    @chef = Chef.create!(name: "steve", email: "steve@example.com",
                       password: "password", password_confirmation: "password")
   @recipe = Recipe.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", chef: @chef)
   @ingredient1 = Ingredient.create(name: "carrot")
   @ingredient2 = Ingredient.create(name: "chick peas")
   @ingredient3 = Ingredient.create(name: "pasta")
   RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: @ingredient1.id, unit: "cup", quantity: "1")
 end

  it 'can return ingredient quantities' do
    
  end

end
