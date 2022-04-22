require_relative 'view'
require_relative 'recipe'

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
    # 2. Ask the user for the description
    description = @view.ask_for("description")
    # 3. Create a new Recipe with the info
    recipe = Recipe.new(name, description)
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
end
