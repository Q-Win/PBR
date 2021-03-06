require 'rails_helper'

RSpec.describe RecipeIngredient, name: :model do

  before(:each) do
    @chef = Chef.create!(name: "steve", email: "steve@example.com",
                       password: "password", password_confirmation: "password")
   @recipe = Recipe.create(name: "vegetable saute", description: "great vegetable sautee, add vegetable and oil", chef: @chef)
   @ingredient1 = Ingredient.create(name: "carrot")
   @ingredient2 = Ingredient.create(name: "chick peas")
   @ingredient3 = Ingredient.create(name: "bread")
   RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: @ingredient1.id, unit: "cup", quantity: "1")
   RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: @ingredient3.id, unit: "oz", quantity: "8")
 end

  it 'can return ingredient quantities' do

      expect(RecipeIngredient.first.display_name).to eq("carrot")
      expect(RecipeIngredient.last.display_name).to eq("bread")

  end

end
