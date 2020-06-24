class RecipeIngredientsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.recipe_ingredients
    @units = RecipeIngredient.all.pluck(:unit).uniq
  end


  def update

  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:display_name, :unit, :quantity)
  end

end
