require_relative 'base_repository'
require_relative '../models/meal'
# require 'csv'

class MealRepository < BaseRepository
  def initialize(csv_file)
    @model = Meal
    super(csv_file)
  end

  # def initialize(csv_file)
  #   @csv_file = csv_file
  #   @meals = []
  #   load_csv if File.exists?(@csv_file)
  #   @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  # end

  # def create(meal)
  #   meal.id = @next_id
  #   @next_id += 1
  #   @meals << meal
  #   save_csv
  # end

  # def all
  #   @meals
  # end

  # def find(id)
  #   @meals.find { |meal| meal.id == id }
  # end

  # private

  # def load_csv
  #   CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
  #     # row used to be a array ["1", burguer", "10"]
  #     # now row is a hash { id: "1", name: "burguer", price: "10"}
  #     row[:id] = row[:id].to_i
  #     row[:price] = row[:price].to_i
  #     @meals << Meal.new(row)
  #   end
  # end

  # def save_csv
  #   CSV.open(@csv_file, 'wb') do |csv|
  #     csv << ["id", "name", "price"]
  #     @meals.each do |meal|
  #       csv << [meal.id, meal.name, meal.price]
  #     end
  #   end
  # end
end
