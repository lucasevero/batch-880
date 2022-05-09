class CustomerView
  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} - #{customer.address}"
    end
  end

  def ask_for_customer_info
    puts "What's the name of your customer?"
    name = gets.chomp
    puts "What's the address of your customer?"
    address = gets.chomp
    [name, address]
  end
end
