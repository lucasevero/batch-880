class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = false
  end

  def run
    @running = true
    while @running do
      display_actions
      input = gets.chomp.to_i
      print `clear`
      action(input)
    end
  end

  private

  def display_actions
    print "\n"
    puts "Please enter your action"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "9 - Exit the program"
  end

  def action(input)
    case input
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then @running = false
    else
      puts "Input another option"
    end
  end
end
