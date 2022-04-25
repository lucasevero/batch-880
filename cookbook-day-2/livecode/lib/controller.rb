require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_allrecipes_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # 1. Get all the recipes from the Cookbook
    recipes = @cookbook.all
    # 2. Display the information to the user
    @view.display_recipes(recipes)
  end

 def create
    # 1. Ask the user for the name
    name = @view.ask_for("name")
    # 2. Ask the user for the description, rating and preparation time
    description = @view.ask_for("description")
    rating = @view.ask_for("rating")
    prep_time = @view.ask_for("preparation time")
    # 3. Create a new Recipe with the info
    recipe = Recipe.new(name, description, rating, prep_time)
    # 4. Add the recipe to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # 1. List all the recipes
    list
    # 2. Ask for the recipe you want to destroy
    index = @view.ask_for("the index of the recipe you want to destroy").to_i - 1
    # 3. DESTROY IT (in the cookbook...)
    @cookbook.remove_recipe(index)
  end

  def import
    # Ask for the ingredient of the recipe
    ingredient = @view.ask_for("the ingredient you are looking for")
    recipes = ScrapeAllrecipesService.new(ingredient).call

    # Display them
    # Ask for the index of the recipe to be added
    index = @view.display_online_recipes_names(recipes)
    chosen_recipe = recipes[index]
    # Create a Recipe with the info given

    prep_time = ScrapeAllrecipesService.new(ingredient).get_prep_time(chosen_recipe[:link])

    new_recipe = Recipe.new(chosen_recipe[:name], chosen_recipe[:description], chosen_recipe[:rating], prep_time)
    # Add it to the cookbook
    @cookbook.add_recipe(new_recipe)
  end

  def mark_as_done
    # Display all the recipes
    list
    # Ask for the recipe thats goin to me marked as done
    index = @view.ask_for("the recipe you want to mark").to_i - 1
    # Get the recipe
    recipe = @cookbook.find(index)
    # Mark it as done
    recipe.mark_as_done!
    # Save it!
    @cookbook.save_in_csv
  end
end
