require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  def initialize(csv_file)
    @model = Employee
    super(csv_file)
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end
end
