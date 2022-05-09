class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? 'X' : ' '
      puts "[#{done}]#{index + 1}. #{recipe.name} - #{recipe.description}: #{recipe.rating}/5.0 - #{recipe.prep_time}"
    end
  end

  def ask_for(info)
    puts "Please enter the #{info}"
    gets.chomp
  end

  def display_online_recipes_names(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe[:name]}"
    end
    puts "Please enter the index of the recipe"
    print "> "
    gets.chomp.to_i - 1
  end
end
