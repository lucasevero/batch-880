require_relative '../views/order_view'
require_relative '../models/order'

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrderView.new
  end

  def list_undelivered_orders
    # 1. get all the undelivered orders from the repo
    orders = @order_repository.undelivered_orders
    # 2. display them for the user
    @view.display_orders(orders)
  end

  def add
    # 1. display all meals
    meals = @meal_repository.all
    @view.display_meals(meals)
    # 2. ask for the index of the meal of the order
    meal_index = @view.ask_for("index of the meal").to_i - 1
    # 3. access the meal by the index
    meal = meals[meal_index]
    # 4. display all customers
    customers = @customer_repository.all
    @view.display_customers(customers)
    # 5. ask for the index of the customer who ordered it
    customer_index = @view.ask_for("index of the customer").to_i - 1
    # 6. access the customer by the index
    customer = customers[customer_index]
    # 7. display all riders -> managers won't deliver an onder
    employees = @employee_repository.all_riders
    @view.display_employees(employees)
    # 8. ask for the index of the rider assigned
    employee_index = @view.ask_for("index of the employee").to_i - 1
    # 9. access the employee by the index
    employee = employees[employee_index]
    # 10. create an order with this info
    order = Order.new({
                        meal: meal,
                        customer: customer,
                        employee: employee
                      })
    # 11. Add it to the order repo
    @order_repository.create(order)
  end

  def list_my_undelivered_orders(employee)
    # 1. get all undelivered orders from this user
    orders = @order_repository.my_undelivered_orders(employee)
    # 2. Display them
    @view.display_orders(orders)
    orders
  end

  def mark_as_delivered(employee)
    # 1. get all undelivered orders from this user
    # 2. display them to the user
    orders = list_my_undelivered_orders(employee)
    # 3. ask for the index of the order to deliver
    index = @view.ask_for("index of the order").to_i - 1
    # 4. get the order by the index of it
    order = orders[index]
    # 5. mark it as delivered
    @order_repository.mark_order_as_delivered(order)
  end
end
