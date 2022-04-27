class OrderView
  def display_orders(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name}; ordered by #{order.customer.name}; assigned to: #{order.employee.username}"
    end
  end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}"
    end
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name}"
    end
  end

  def display_employees(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end

  def ask_for(info)
    puts "#{info}?"
    gets.chomp
  end
end
