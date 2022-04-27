require_relative '../models/meal'
require_relative '../views/meal_view'

class MealsController
  def initialize(repository)
    @repository = repository
    @view = MealView.new
  end

  def list
    # 1. Get all the meals from the repo
    meals = @repository.all
    # 2. Display them !
    @view.display_meals(meals)
  end

  def add
    # 1. Ask for the info of the meal
    name, price = @view.ask_for_meal_info
    # 2. Create a new meal with the info
    meal = Meal.new(name: name, price: price)
    # 3. Add it to the repo
    @repository.create(meal)
  end
end
