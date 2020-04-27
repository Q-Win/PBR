class IngredientsController < ApplicationController
   before_action :set_ingredient, only: [:show, :edit]

  def show
    @recipes = @ingredient.recipes
  end

  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
  end

  def new
    @ingredient = Ingredient.new
  end

  def create

  end

  def edit

  end

  def updates

  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end
