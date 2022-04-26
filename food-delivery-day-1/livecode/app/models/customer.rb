class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @address = attr[:address]
  end

  private

  def self.prepare_to_load(row)
    row[:id] = row[:id].to_i
    row
  end

  def self.csv_headers
    ['id', 'name', 'address']
  end

  def self.prepare_to_save(customer)
    [customer.id, customer.name, customer.address]
  end
end
