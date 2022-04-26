class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @price = attr[:price]
  end

  private

  def self.prepare_to_load(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    row
  end

  def self.csv_headers
    ['id', 'name', 'price']
  end

  def self.prepare_to_save(meal)
    [meal.id, meal.name, meal.price]
  end
end
