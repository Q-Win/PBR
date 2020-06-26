class IngredientsController < ApplicationController
   before_action :set_ingredient, only: [:show, :edit, :update]
   before_action :require_admin, except: [:show, :index]

  def show
    @recipes = @ingredient.recipes
  end

  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 20).order(:name)
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

  def update
    if @ingredient.update(ingredient_params)
      flash[:success] = "Ingredient name was updated successfully"
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def add_ingredients
    ingredients = ["oat", "whole wheat flour", "banana", "baking soda", "plant milk", "coco powder", "lentil", "potato", "soy milk", "salt", "black pepper", "pumpkin puree", "sugar", "olive oil", "vanilla", "baking powder", "pumpkin spice", "all purpose flour", "white sugar", "brown sugar", "chocolate chip" , "water", "black bean", "garlic", "green bell pepper", "jalapeno pepper", "onion", "red bell pepper", "tomato", "chili powder", "paprika", "cumin", "carrot", "lemon juice", "nutritional yeast", "onion powder", "garlic powder", "salsa", "tomato paste", "zucchini", "celery", "chick pea", "vegetable broth", "basil", "sugar snap pea", "almond butter", "sun dried tomato", "split green pea", "pepper", "mushroom", "oregano", "oat flour", "brown rice", "kidney bean", "broccoli", "dill", "butter", "cinnamon", "cayenne powder", "lime juice", "rosemary", "bay leaf", "bread crumb", "italian seasoning", "red lentil", "quinoa", "red pepper flake", "parsley", "tahini", "cannellini bean", "turmeric", "whole wheat pastaa"]

    ingredients.each do |i|
      Ingredient.create(name: i)
    end

  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "Only admin users can perform that action"
      redirect_to ingredients_path
    end
  end

end
