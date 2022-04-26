require_relative 'base_repository'
require_relative '../models/customer'
# require 'csv'

class CustomerRepository < BaseRepository
  def initialize(csv_file)
    @model = Customer
    super(csv_file)
  end

  # def initialize(csv_file)
  #   @csv_file = csv_file
  #   @customers = []
  #   load_csv if File.exists?(@csv_file)
  #   @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  # end

  # def create(customer)
  #   customer.id = @next_id
  #   @next_id += 1
  #   @customers << customer
  #   save_csv
  # end

  # def all
  #   @customers
  # end

  # def find(id)
  #   @customers.find { |customer| customer.id == id }
  # end

  # private

  # def load_csv
  #   CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
  #     row[:id] = row[:id].to_i
  #     @customers << Customer.new(row)
  #   end
  # end

  # def save_csv
  #   CSV.open(@csv_file, 'wb') do |csv|
  #     csv << ["id", "name", "address"]
  #     @customers.each do |customer|
  #       csv << [customer.id, customer.name, customer.address]
  #     end
  #   end
  # end
end
