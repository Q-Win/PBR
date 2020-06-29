class RecipeIngredientsController < ApplicationController
  before_action :require_user, only: [:index]

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

  def get_recipeingredients

    recipe_ingredients = [{:rname=>"Black Bean Soup", :iname=>"bay leaf", :display_name=>"bay leaf", :quantity=>"2", :unit=>"whole"}, {:rname=>"White Bean Fettuccine Alfredo", :iname=>"cannellini bean", :display_name=>"cannellini bean", :quantity=>"1.5", :unit=>"cup"}, {:rname=>"Hot Chocolate", :iname=>"coco powder", :display_name=>"coco powder", :quantity=>"1", :unit=>"tbsp"}, {:rname=>"Jerk Lentils", :iname=>"lentil", :display_name=>"lentils", :quantity=>"1", :unit=>"lb"}, {:rname=>"Jerk Lentils", :iname=>"tomato paste", :display_name=>"tomato paste", :quantity=>"1", :unit=>"tbsp"}, {:rname=>"Whole Grain Pancakes", :iname=>"oat", :display_name=>"oat", :quantity=>"1/2", :unit=>"cup"}, {:rname=>"Jerk Lentils", :iname=>"onion", :display_name=>"onion", :quantity=>"1", :unit=>"whole"}, {:rname=>"Whole Grain Pancakes", :iname=>"whole wheat flour", :display_name=>"whole wheat flour", :quantity=>"1/4", :unit=>"cup"}, {:rname=>"Whole Grain Pancakes", :iname=>"banana", :display_name=>"banana", :quantity=>"1", :unit=>"medium"}, {:rname=>"Whole Grain Pancakes", :iname=>"baking soda", :display_name=>"baking soda", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Whole Grain Pancakes", :iname=>"plant milk", :display_name=>"plant milk", :quantity=>"6-8", :unit=>"oz"}, {:rname=>"Whole Grain Pancakes", :iname=>"coco powder", :display_name=>"coco powder", :quantity=>"1", :unit=>"tb"}, {:rname=>"Mashed Potatoes", :iname=>"potato", :display_name=>"potato", :quantity=>"2", :unit=>"pound"}, {:rname=>"Mashed Potatoes", :iname=>"soy milk", :display_name=>"soy milk", :quantity=>"1", :unit=>"cup"}, {:rname=>"Mashed Potatoes", :iname=>"salt", :display_name=>"salt", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Pumpkin Bread", :iname=>"whole wheat flour", :display_name=>"whole wheat flour", :quantity=>"2", :unit=>"cup"}, {:rname=>"Pumpkin Bread", :iname=>"pumpkin puree", :display_name=>"pumpkin puree", :quantity=>"1", :unit=>"can"}, {:rname=>"Pumpkin Bread", :iname=>"soy milk", :display_name=>"soy milk", :quantity=>"1/3", :unit=>"cup"}, {:rname=>"Pumpkin Bread", :iname=>"olive oil", :display_name=>"olive oil", :quantity=>"1/3", :unit=>"cup"}, {:rname=>"Pumpkin Bread", :iname=>"vanilla", :display_name=>"vanilla", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Pumpkin Bread", :iname=>"baking powder", :display_name=>"baking powder", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Pumpkin Bread", :iname=>"baking soda", :display_name=>"baking soda", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Chocolate Chip Cookies", :iname=>"all purpose flour", :display_name=>"all purpose flour", :quantity=>"2", :unit=>"cup"}, {:rname=>"Chocolate Chip Cookies", :iname=>"white sugar", :display_name=>"white sugar", :quantity=>"1/2", :unit=>"cup"}, {:rname=>"Chocolate Chip Cookies", :iname=>"brown sugar", :display_name=>"brown sugar", :quantity=>"1/2", :unit=>"cup"}, {:rname=>"Chocolate Chip Cookies", :iname=>"salt", :display_name=>"salt", :quantity=>"1/4", :unit=>"tsp"}, {:rname=>"Chocolate Chip Cookies", :iname=>"vanilla", :display_name=>"vanilla", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Chocolate Chip Cookies", :iname=>"olive oil", :display_name=>"olive oil", :quantity=>"1/4", :unit=>"cup"}, {:rname=>"Chocolate Chip Cookies", :iname=>"chocolate chip", :display_name=>"chocolate chip", :quantity=>"2/3", :unit=>"cup"}, {:rname=>"Whole Wheat Tortilla", :iname=>"whole wheat flour", :display_name=>"whole wheat flour", :quantity=>"2", :unit=>"cup"}, {:rname=>"Whole Wheat Tortilla", :iname=>"water", :display_name=>"water", :quantity=>"1", :unit=>"cup"}, {:rname=>"Hot Chocolate", :iname=>"plant milk", :display_name=>"plant milk", :quantity=>"1.5", :unit=>"cup"}, {:rname=>"Hot Chocolate", :iname=>"sugar", :display_name=>"sugar", :quantity=>"1-2", :unit=>"tbsp"}, {:rname=>"Black Bean Soup", :iname=>"black bean", :display_name=>"black bean", :quantity=>"1", :unit=>"lb"}, {:rname=>"Black Bean Soup", :iname=>"green bell pepper", :display_name=>"green bell pepper", :quantity=>"1", :unit=>"medium"}, {:rname=>"Black Bean Soup", :iname=>"onion", :display_name=>"onion", :quantity=>"1", :unit=>"medium"}, {:rname=>"Black Bean Soup", :iname=>"red bell pepper", :display_name=>"red bell pepper", :quantity=>"1", :unit=>"medium"}, {:rname=>"Black Bean Soup", :iname=>"tomato", :display_name=>"tomato", :quantity=>"1", :unit=>"canned"}, {:rname=>"Black Bean Soup", :iname=>"black pepper", :display_name=>"black pepper", :quantity=>"1/2", :unit=>"tsp"}, {:rname=>"Black Bean Soup", :iname=>"paprika", :display_name=>"paprika", :quantity=>"1", :unit=>"tbsp"}, {:rname=>"Black Bean Soup", :iname=>"salt", :display_name=>"salt", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Black Bean Soup", :iname=>"cumin", :display_name=>"cumin", :quantity=>"2", :unit=>"tbsp"}, {:rname=>"Nacho Cheese", :iname=>"potato", :display_name=>"potato", :quantity=>"2", :unit=>"cup"}, {:rname=>"Nacho Cheese", :iname=>"carrot", :display_name=>"carrot", :quantity=>"1", :unit=>"cup"}, {:rname=>"Nacho Cheese", :iname=>"water", :display_name=>"water", :quantity=>"1", :unit=>"cup"}, {:rname=>"Nacho Cheese", :iname=>"lemon juice", :display_name=>"lemon juice", :quantity=>"1", :unit=>"tbsp"}, {:rname=>"Nacho Cheese", :iname=>"onion powder", :display_name=>"onion powder", :quantity=>"½", :unit=>"tsp"}, {:rname=>"Nacho Cheese", :iname=>"garlic powder", :display_name=>"garlic powder", :quantity=>"½", :unit=>"tsp"}, {:rname=>"Nacho Cheese", :iname=>"salsa", :display_name=>"salsa", :quantity=>"¼", :unit=>"cup"}, {:rname=>"Minestrone", :iname=>"tomato", :display_name=>"tomato", :quantity=>"4", :unit=>"medium"}, {:rname=>"Minestrone", :iname=>"tomato paste", :display_name=>"tomato paste", :quantity=>"1/2", :unit=>"cup"}, {:rname=>"Minestrone", :iname=>"zucchini", :display_name=>"zucchini", :quantity=>"2", :unit=>"medium"}, {:rname=>"Minestrone", :iname=>"celery", :display_name=>"celery", :quantity=>"2", :unit=>"stalk"}, {:rname=>"Minestrone", :iname=>"chick pea", :display_name=>"chick pea", :quantity=>"1", :unit=>"can"}, {:rname=>"Minestrone", :iname=>"vegetable broth", :display_name=>"vegetable broth", :quantity=>"4", :unit=>"cup"}, {:rname=>"Minestrone", :iname=>"whole wheat pastaa", :display_name=>"whole wheat pastum", :quantity=>"5", :unit=>"oz"}, {:rname=>"White Bean Fettuccine Alfredo", :iname=>"whole wheat pastaa", :display_name=>"whole wheat pastum", :quantity=>"8", :unit=>"oz."}, {:rname=>"White Bean Fettuccine Alfredo", :iname=>"sugar snap pea", :display_name=>"sugar snap pea", :quantity=>"8", :unit=>"oz."}, {:rname=>"White Bean Fettuccine Alfredo", :iname=>"nutritional yeast", :display_name=>"nutritional yeast", :quantity=>"2", :unit=>"tbsp"}, {:rname=>"White Bean Fettuccine Alfredo", :iname=>"almond butter", :display_name=>"almond butter", :quantity=>"2", :unit=>"tbsp"}, {:rname=>"White Bean Fettuccine Alfredo", :iname=>"salt", :display_name=>"salt", :quantity=>"1", :unit=>"pinch"}, {:rname=>"White Bean Fettuccine Alfredo", :iname=>"black pepper", :display_name=>"black pepper", :quantity=>"1", :unit=>"pinch"}, {:rname=>"Split Pea Soup", :iname=>"split green pea", :display_name=>"split green pea", :quantity=>"1", :unit=>"pound"}, {:rname=>"Split Pea Soup", :iname=>"potato", :display_name=>"potato", :quantity=>"1", :unit=>"lb"}, {:rname=>"Split Pea Soup", :iname=>"carrot", :display_name=>"carrot", :quantity=>"2", :unit=>"cup"}, {:rname=>"Split Pea Soup", :iname=>"onion", :display_name=>"onion", :quantity=>"1", :unit=>"medium"}, {:rname=>"Split Pea Soup", :iname=>"garlic", :display_name=>"garlic", :quantity=>"5", :unit=>"clofe"}, {:rname=>"Split Pea Soup", :iname=>"pepper", :display_name=>"pepper", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"onion", :display_name=>"onion", :quantity=>"1", :unit=>"medium"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"mushroom", :display_name=>"mushroom", :quantity=>"4", :unit=>"cup"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"garlic", :display_name=>"garlic", :quantity=>"1", :unit=>"tbsp"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"oregano", :display_name=>"oregano", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"oat flour", :display_name=>"oat flour", :quantity=>"¼", :unit=>"cup"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"nutritional yeast", :display_name=>"nutritional yeast", :quantity=>"3", :unit=>"tbsp"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"salt", :display_name=>"salt", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"black pepper", :display_name=>"black pepper", :quantity=>"⅛", :unit=>"tsp"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"kidney bean", :display_name=>"kidney bean", :quantity=>"2¼", :unit=>"cup"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"broccoli", :display_name=>"broccoli", :quantity=>"2", :unit=>"cup"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"dill", :display_name=>"dill", :quantity=>"⅓", :unit=>"cup"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"lemon juice", :display_name=>"lemon juice", :quantity=>"2", :unit=>"tbsp"}, {:rname=>"Candied Carrots", :iname=>"butter", :display_name=>"butter", :quantity=>"1/4", :unit=>"cup"}, {:rname=>"Candied Carrots", :iname=>"brown sugar", :display_name=>"brown sugar", :quantity=>"1/4", :unit=>"cup"}, {:rname=>"Candied Carrots", :iname=>"cinnamon", :display_name=>"cinnamon", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Candied Carrots", :iname=>"cayenne powder", :display_name=>"cayenne powder", :quantity=>"1/4", :unit=>"tsp"}, {:rname=>"Five-Ingredient Veggie Burger", :iname=>"black bean", :display_name=>"black bean", :quantity=>"2", :unit=>"cup"}, {:rname=>"Five-Ingredient Veggie Burger", :iname=>"onion", :display_name=>"onion", :quantity=>"1", :unit=>"medium"}, {:rname=>"Five-Ingredient Veggie Burger", :iname=>"lime juice", :display_name=>"lime juice", :quantity=>"1", :unit=>"tbsp."}, {:rname=>"Five-Ingredient Veggie Burger", :iname=>"chili powder", :display_name=>"chili powder", :quantity=>"2", :unit=>"tsp."}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"mushroom", :display_name=>"mushroom", :quantity=>"8", :unit=>"oz"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"carrot", :display_name=>"carrot", :quantity=>"1", :unit=>"cup"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"onion", :display_name=>"onion", :quantity=>"1", :unit=>"cup"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"garlic", :display_name=>"garlic", :quantity=>"4", :unit=>"clofe"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"vegetable broth", :display_name=>"vegetable broth", :quantity=>"½", :unit=>"cup"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"tomato paste", :display_name=>"tomato paste", :quantity=>"¼", :unit=>"cup"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"rosemary", :display_name=>"rosemary", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"bay leaf", :display_name=>"bay leaf", :quantity=>"1", :unit=>"whole"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"black pepper", :display_name=>"black pepper", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"whole wheat pastaa", :display_name=>"whole wheat pastum", :quantity=>"8", :unit=>"oz."}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"red lentil", :display_name=>"red lentil", :quantity=>"¾", :unit=>"cup"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"quinoa", :display_name=>"quinoa", :quantity=>"½", :unit=>"cup"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"red pepper flake", :display_name=>"red pepper flake", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"water", :display_name=>"water", :quantity=>"2½", :unit=>"cup"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"onion powder", :display_name=>"onion powder", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"cumin", :display_name=>"cumin", :quantity=>"2", :unit=>"tsp"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"parsley", :display_name=>"parsley", :quantity=>"3", :unit=>"tbsp"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"tahini", :display_name=>"tahini", :quantity=>"¼", :unit=>"cup"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"lemon juice", :display_name=>"lemon juice", :quantity=>"1", :unit=>"tbsp"}, {:rname=>"Black Bean Soup", :iname=>"garlic", :display_name=>"garlic", :quantity=>"3", :unit=>"clove"}, {:rname=>"Mashed Potatoes", :iname=>"black pepper", :display_name=>"black pepper", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Pumpkin Bread", :iname=>"sugar", :display_name=>"sugar", :quantity=>"3/4", :unit=>"cup"}, {:rname=>"Pumpkin Bread", :iname=>"salt", :display_name=>"salt", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Pumpkin Bread", :iname=>"pumpkin spice", :display_name=>"pumpkin spice", :quantity=>"1", :unit=>"tb"}, {:rname=>"Chocolate Chip Cookies", :iname=>"baking soda", :display_name=>"baking soda", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Chocolate Chip Cookies", :iname=>"soy milk", :display_name=>"soy milk", :quantity=>"1/4", :unit=>"cup"}, {:rname=>"Whole Wheat Tortilla", :iname=>"salt", :display_name=>"salt", :quantity=>"pinch", :unit=>"of"}, {:rname=>"Hot Chocolate", :iname=>"chocolate chip", :display_name=>"chocolate chip", :quantity=>"1", :unit=>"tbsp"}, {:rname=>"Black Bean Soup", :iname=>"jalapeno pepper", :display_name=>"jalapeno pepper", :quantity=>"1", :unit=>"medium"}, {:rname=>"Black Bean Soup", :iname=>"chili powder", :display_name=>"chili powder", :quantity=>"2", :unit=>"tbsp"}, {:rname=>"Nacho Cheese", :iname=>"green bell pepper", :display_name=>"green bell pepper", :quantity=>"1/2", :unit=>"cup"}, {:rname=>"Nacho Cheese", :iname=>"nutritional yeast", :display_name=>"nutritional yeast", :quantity=>"½", :unit=>"cup"}, {:rname=>"Nacho Cheese", :iname=>"salt", :display_name=>"salt", :quantity=>"2", :unit=>"tbsp"}, {:rname=>"Minestrone", :iname=>"carrot", :display_name=>"carrot", :quantity=>"2", :unit=>"medium"}, {:rname=>"Minestrone", :iname=>"basil", :display_name=>"basil", :quantity=>"2", :unit=>"tbsp"}, {:rname=>"White Bean Fettuccine Alfredo", :iname=>"garlic", :display_name=>"garlic", :quantity=>"2", :unit=>"clofe"}, {:rname=>"White Bean Fettuccine Alfredo", :iname=>"sun dried tomato", :display_name=>"sun dried tomato", :quantity=>"⅓", :unit=>"cup"}, {:rname=>"Split Pea Soup", :iname=>"vegetable broth", :display_name=>"vegetable broth", :quantity=>"8", :unit=>"cup"}, {:rname=>"Split Pea Soup", :iname=>"salt", :display_name=>"salt", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"soy milk", :display_name=>"soy milk", :quantity=>"2", :unit=>"cup"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"turmeric", :display_name=>"ground turmeric", :quantity=>"1", :unit=>"pinch"}, {:rname=>"Cheesy Kidney Bean and Rice Casserole", :iname=>"brown rice", :display_name=>"brown rice", :quantity=>"2", :unit=>"cup"}, {:rname=>"Candied Carrots", :iname=>"salt", :display_name=>"salt", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Five-Ingredient Veggie Burger", :iname=>"oat", :display_name=>"oat", :quantity=>"½", :unit=>"cup"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"zucchini", :display_name=>"zucchini", :quantity=>"1", :unit=>"medium"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"tomato", :display_name=>"tomato", :quantity=>"2", :unit=>"can"}, {:rname=>"Vegetable Cacciatore with Rotini", :iname=>"salt", :display_name=>"salt", :quantity=>"1", :unit=>"pinch"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"garlic powder", :display_name=>"garlic powder", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Spicy Red Lentil Wraps", :iname=>"salt", :display_name=>"salt", :quantity=>"½", :unit=>"tsp"}, {:rname=>"Nacho Cheese", :iname=>"turmeric", :display_name=>"turmeric", :quantity=>"1", :unit=>"tsp"}, {:rname=>"Black Bean Soup", :iname=>"vegetable broth", :display_name=>"vegetable broth", :quantity=>"6.5", :unit=>"cups"}, {:rname=>"Candied Carrots", :iname=>"carrot", :display_name=>"baby carrots", :quantity=>"2", :unit=>"bags"}]

    recipe_ingredients.each do |ri|
      recipe_id = Recipe.find_by(name: ri[:rname]).id
      ingredient_id = Ingredient.find_by(name: ri[:iname]).id
      RecipeIngredient.create(recipe_id: recipe_id, ingredient_id: ingredient_id, display_name: ri[:display_name], unit: ri[:unit], quantity: ri[:quantity])
    end
    redirect_to recipes_path
  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:display_name, :unit, :quantity)
  end

  def require_same_user
    if current_user != @recipe.chef and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own recipes"
      redirect_to recipes_path
    end
  end

end
