class RecipeIngredientsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.recipe_ingredients
    @units = RecipeIngredient.all.pluck(:unit).uniq
  end


  def update
    
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @recipe = Recipe.find(@recipe_ingredient.recipe_id)
    if @recipe_ingredient.update(recipe_ingredient_params)
      flash[:success] = "Recipe was updated successfully!"
      redirect_to recipe_recipe_ingredients_path(@recipe)
    else
      redirect_to recipe_recipe_ingredients_path(@recipe)
    end
  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:display_name, :unit, :quantity)
  end

end
