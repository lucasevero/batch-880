class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attr = {})
    @id = attr[:id]
    @delivered = attr[:delivered] || false
    @meal = attr[:meal] # Instance of Meal
    @customer = attr[:customer] # Instance of Customer
    @employee = attr[:employee] # Instance of Employee
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
