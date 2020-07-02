class RecipesController < ApplicationController
   before_action :set_recipe, only: [:show, :edit, :update, :destroy]
   before_action :require_user, except: [:index, :show, :get_recipes]
   before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.paginate(page: params[:page], per_page: 5)
    @ingredient_quantaties = @recipe.ingredient_quantaties
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @categories = Category.all.order(:name)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user
    if @recipe.save
      flash[:success] = "Recipe was created successfully!"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
    @ingredients = Ingredient.all.order(:name)
    @categories = Category.all.order(:name)
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was updated successfully!"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = "Recipe deleted successfully"
    redirect_to recipes_path
  end

  def pbrbeta
    pbrbeta_service = PbrbetaService.new
    pbrbeta_service.add_recipes_to_database(current_user.id)
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, ingredient_ids: [],category_ids: [])
  end

  def require_same_user
    if current_user != @recipe.chef and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own recipes"
      redirect_to recipes_path
    end
  end

end
