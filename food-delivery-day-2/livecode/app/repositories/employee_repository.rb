require 'csv'
require_relative '../models/employee'
# require_relative 'base_repository'

class EmployeeRepository # < BaseRepository
  # def initialize(csv_file)
  #   @model = Employee
  #   super(csv_file)
  # end
  # undef_method :create # for the base repo

  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    load_csv if File.exists?(@csv_file)
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end

  def all_riders
    @employees.select { |employee| employee.rider? }
  end

  def find_by_username(username)
    @employees.find { |element| element.username == username }
  end

  def all
    @employees
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id", "username", "password", "role"]
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end
end
