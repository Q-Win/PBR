class RecipeIngredientsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.recipe_ingredients
    @units = RecipeIngredient.all.pluck(:unit).uniq
  end


end
