class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = false
  end

  def run
    @running = true
    while @running
      @employee = @sessions_controller.log_in
      while @employee do
        # If Im a Manager
        if @employee.manager?
          display_manager_actions
          input = gets.chomp.to_i
          print `clear`
          manager_action(input)
        # If Im a rider
        else
          display_rider_actions
          input = gets.chomp.to_i
          print `clear`
          rider_action(input)
        end
      end
    end
  end

  private

  def display_manager_actions
    print "\n"
    puts "Please enter your action"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "5 - List undelivered orders"
    puts "6 - Add a order"
    puts "8 - Log out"
    puts "9 - Exit the program"
  end

  def display_rider_actions
    print "\n"
    puts "Please enter your action"
    puts "1 - List all my undelivered orders"
    puts "2 - Mark as delivered"
    puts "8 - Log out"
    puts "9 - Exit the program"
  end

  def manager_action(input)
    case input
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 8 then @employee = nil
    when 9
      @employee = nil
      @running = false
    else
      puts "Input another option"
    end
  end

  def rider_action(input)
    case input
    when 1 then @orders_controller.list_my_undelivered_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 8 then @employee = nil
    when 9
      @employee = nil
      @running = false
    else
      puts "Input another option"
    end
  end
end
