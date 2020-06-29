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

  def get_recipes
    recipes = [{:name=>"Jerk Lentils", :description=>"please fill this out", :instructions=>"Dice potatoes, onions, carrots, and garlic. Saute onions, carrots, and garlic in oil or water to soften them. Should take 5-10 minutes. Then add peas, broth, and poatoes to pot. Bring to a boil. Cover and simmer for 45-55 minutes.", :notes=>""}, {:name=>"Mashed Potatoes", :description=>"please fill this out", :instructions=>"Cut potatoes into 1 inch pieces. Boil for around 25 minutes or until soft. Mash with hand masher or electric. ", :notes=>"You can peel or not peel the potatoes. You can add butter if you don't care about it being oil free."}, {:name=>"Pumpkin Bread", :description=>"please fill this out", :instructions=>"Mix all dry ingredients except the sugar in a large mixing bowl. \r\n\r\nIn a separate bowl mix olive oil, soy milk, sugar, and vanilla. Add the wet mixture into the dry ingredient bowl. Then mix in the pumpkin puree. \r\n\r\nAdd the dough to a lightly greased loaf pan. \r\n\r\nBake in over at 350 F for 55-60 minutes.", :notes=>"You can use unsweet apple sauce instead of olive oil for an oil free recipe. If you want to make muffins instead of a loaf you can bake in a muffin sheet at 375 for 20 minutes."}, {:name=>"Whole Wheat Tortilla", :description=>"please fill this out", :instructions=>"Mix salt and  flour in a bowl. Once they are mixed slowly add water to flour salt mixture, mixing as you go. You want to slowly add the water so that your dough doesn't get too wet and messy. Once you have a nice ball of dough cover it and let it rest for 15 minutes. Then cut the dough into 8 even balls. Roll each ball of dough into a tortilla. Then heat in a pan over med heat for about 1 minute flipping half way through. ", :notes=>"Make sure to use warm water."}, {:name=>"Hot Chocolate", :description=>"please fill this out", :instructions=>"Add milk to sauce pan and bring to boil over med heat. Add in coco powder and chocolate chips. Whisk until they have all dissolved. Add in as much sugar as you'd like. Pour into a mug. You can keep adding sugar after this so its best to add a little at a time and taste.", :notes=>"Use as much or little sugar as you like. Add to taste."}, {:name=>"Nacho Cheese", :description=>"please fill this out", :instructions=>"Chop and boil the potatoes and carrots Until Soft (About 10 Minutes). Before the Potatoes and Carrots get Too Soft add the Chopped Bell Peppers into the same Pot, only Cooking for 1-2 minutes. Drain Water. Put Softened Potatoes, Carrots, Bell Pepper, Water, Lemon Juice, Nutritional Yeast, Onion Powder, Garlic Powder, Turmeric Powder, Salt, And Salsa (Optional) In A Blender. Blend Until Completely Smooth.", :notes=>"If the mixture is too thick for your liking, add more water and feel free to add more seasonings."}, {:name=>"Minestrone", :description=>"please fill this out", :instructions=>"Chop the carrots, celery, and tomatoes into bite size pieces.\r\n\r\n   Add the carrots and celery to a large soup pot and sautee with oil or water for about 5 minutes.\r\n\r\n  Once the carrots and celery are softened. Add the tomatoes, broth, and tomato paste\r\n  and bring to a boil. Once it is boiling reduce the heat to low, cover, and simmer for\r\n  20 minutes.\r\n\r\n  Next add the zucchini, chick peas, and pasta to the pot. Bring to a boil. Once it comes\r\n  to a boil, reduce the heat to low, cover, and simmer fo 20 minutes.\r\n\r\n  After that add some fresh basil and serve.", :notes=>"You can use water or oil to sautee veggies."}, {:name=>"White Bean Fettuccine Alfredo", :description=>"please fill this out", :instructions=>"Cook fettuccine according to package directions for al dente, adding peas the last 3 minutes of cooking. Drain, reserving ¾ cup cooking liquid.\r\nMeanwhile, in a food processor combine beans, garlic, nutritional yeast, and almond butter. Process until smooth. Add the reserved cooking liquid; process until smooth.\r\nReturn pasta and peas to the pot. Stir in bean sauce and tomatoes. Season with salt and pepper.", :notes=>""}, {:name=>"Split Pea Soup", :description=>"please fill this out", :instructions=>"Dice potatoes, onions, carrots, and garlic. Saute onions, carrots, and garlic in oil or water to soften them. Should take 5-10 minutes. Then add peas, broth, and poatoes to pot. Bring to a boil. Cover and simmer for 45-55 minutes.", :notes=>""}, {:name=>"Cheesy Kidney Bean and Rice Casserole", :description=>"please fill this out", :instructions=>"Cook rice. Should yield around 6 cups cooked.Preheat the oven to 400°F.\r\nHeat a skillet on high. Add the onions, mushrooms, garlic, and oregano; sauté 10 minutes, stirring frequently. If needed, add water, 1 to 2 tablespoons at a time, to prevent sticking.\r\nTo make the cheesy sauce, in a medium bowl, combine the milk, oat flour, nutritional yeast, turmeric, salt, pepper, and 1 cup water; mix well.\r\nIn a large bowl, combine the sautéed vegetables, rice, beans, and broccoli. Add the cheesy sauce and lemon juice. Reserve 1 tablespoon of dill for garnish, and add the remaining dill to the bowl.\r\nSpread mixture evenly in a 9x13-inch casserole dish. Bake for 30 minutes.\r\nGarnish with dill before serving.", :notes=>""}, {:name=>"Candied Carrots", :description=>"please fill this out", :instructions=>"Boil the baby carrots until tender. Drain.\r\n\r\nIn a skillet, melt butter on medium heat. Stir in the honey, brown sugar, cinnamon, salt and cayenne pepper.\r\n\r\nBring the glaze to a boil and continue to cook, stirring constantly for a few minutes. The glaze should reduce and thicken a little bit.\r\n\r\nDump in the cooked carrots and stir so they are all well coated in the glaze. \r\n\r\nReduce heat to a simmer and continue to cook for another 5 minutes, stirring often. ", :notes=>""}, {:name=>"Five-Ingredient Veggie Burger", :description=>"please fill this out", :instructions=>"In a food processor combine the first five ingredients (through chili powder). Cover; pulse until chunky but not pureed. Add a small amount of reserved bean liquid if mixture seems dry or isn’t sticking together. Mixture should be moist but not wet. Season with salt and pepper.\r\nWith wet hands, shape mixture into four 3½-inch patties. Chill at least 20 minutes.\r\nIn a large nonstick skillet cook burgers over medium-high heat 8 to 10 minutes or until burgers are lightly browned and cooked through, turning once.", :notes=>"Serve burgers with what ever you like on burgers."}, {:name=>"Whole Grain Pancakes", :description=>"Soft and fluffy pancakes", :instructions=>"Add all ingredients in a blender and mix well. Heat pan to med-high heat. Make sure pan is hot before making first pancake. Add oil/butter to pan and pour pancake batter from blender into pan. Cook pancakse on both sides for 2 minutes. Pancakes should form a film before they are ready to flip.", :notes=>"Use a ripe banana. Coco powder is optional. You can use water instead of milk. Top with you choice of syrup, peanut butter, jelly, fruit, ice cream, etc."}, {:name=>"Black Bean Soup", :description=>"Hearty black bean soup with lots of vegetables.", :instructions=>"Dice all the vegetables. Then place all ingredients in a slow cooker and cook on low for 10 hours. One hour prior to serving remove the bay leaves and use a potato masher to mash a few of the beans. This will give it a thicker texture.", :notes=>"Use 1 lb dry black beans, not canned."}, {:name=>"Vegetable Cacciatore with Rotini", :description=>"please fill this out", :instructions=>"For sauce, in a large saucepan cook the mushrooms, zucchini, carrots, onions, and garlic over medium 7 minutes, stirring occasionally and adding white wine, 1 to 2 Tbsp. at a time, as needed to prevent sticking. Add any remaining wine and the next five ingredients (through bay leaf). Bring to boiling; reduce heat. Simmer, uncovered, 20 minutes or until sauce is thick, stirring occasionally. Season with salt and pepper. Remove bay leaf.\r\nMeanwhile, cook rotini according to package directions; drain. Top with sauce and, if desired, sprinkle with nutritional yeast and/or additional fresh rosemary.", :notes=>""}, {:name=>"Spicy Red Lentil Wraps", :description=>"please fill this out", :instructions=>"In a medium-saucepan, then add the water, lentils, quinoa, cumin, garlic & onion-powder, salt and red-pepper-flakes, bring to a boil, cover & simmer about 20minutes.\r\nRemove from heat, add chopped-parsley & scallions, let rest for ten minutes. If you feel it is too dry, add a few tbsp of water. Mixture ought to be creamy, not-dry. Add additional spices to flavor.\r\nTahini sauce\r\nIn a small-bowl whisk together the tahini, lemon, water, salt, red-pepper-flakes and parsley. Put aside.\r\n", :notes=>"Use pre-shredded cabbage for ease"}, {:name=>"Chocolate Chip Cookies", :description=>"Quick and easy soft chocolate chip cookies", :instructions=>"Mix flour, sugars, baking powder, and salt together in a large mixing bowl. Once dry ingredients are mixed add olive oil and vanilla. Then add the milk 1 tbs at a time so the dough doesn't get too wet. After that mix in the chocolate chips. Once everything is mixed let dough chill in the freezer for 15 minutes or in the fridge for at least 1 hour. Then add small balls of cookie dough to a baking sheet. Bake at 350 F for 10 minutes. ", :notes=>"You can use more or less chocolate chips if you want."}]

    recipes.each do |r|
      Recipe.create(name: r[:name], description: r[:description], instructions: r[:instructions], notes: r[:notes], chef_id: current_user.id)
    end

    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, ingredient_ids: [])
  end

  def require_same_user
    if current_user != @recipe.chef and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own recipes"
      redirect_to recipes_path
    end
  end

end
