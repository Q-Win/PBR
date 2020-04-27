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
    @ingredient = Ingredient.new(ingredient_params)
   if @ingredient.save
     flash[:success] = "Ingredient was successfully created"
     redirect_to ingredient_path(@ingredient)
   else
     render 'new'
   end

  end

  def edit

  end

  def updates

  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end
