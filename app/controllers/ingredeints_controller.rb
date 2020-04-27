class IngredientsController < ApplicationController

  def show

  end

  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
  end

  def new

  end

  def create

  end

  def edit

  end

  def updates

  end

end
