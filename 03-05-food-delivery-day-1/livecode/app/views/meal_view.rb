class MealView
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}: #{meal.price}"
    end
  end

  def ask_for_meal_info
    puts "What's the name of your meal?"
    name = gets.chomp
    puts "What's the price of your meal?"
    price = gets.chomp.to_i
    [name, price]
  end
end
