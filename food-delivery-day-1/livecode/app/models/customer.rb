class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @address = attr[:address]
  end

  def prepare_to_save
    [@id, @name, @address]
  end

  def self.prepare_to_load(row)
    row[:id] = row[:id].to_i
    row
  end

  def self.csv_headers
    ['id', 'name', 'address']
  end
end
