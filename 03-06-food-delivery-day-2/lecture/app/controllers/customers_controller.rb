require_relative '../models/customer'
require_relative '../views/customer_view'

class CustomersController
  def initialize(repository)
    @repository = repository
    @view = CustomerView.new
  end

  def list
    # 1. Get all the customers from the repo
    customers = @repository.all
    # 2. Display them !
    @view.display_customers(customers)
  end

  def add
    # 1. Ask for the info of the customer
    name, address = @view.ask_for_customer_info
    # 2. Create a new customer with the info
    customer = Customer.new(name: name, address: address)
    # 3. Add it to the repo
    @repository.create(customer)
  end
end
