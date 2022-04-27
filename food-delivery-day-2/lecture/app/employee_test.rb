require_relative 'repositories/employee_repository'

csv_file = File.join(__dir__, "../data/employees.csv")
repo = EmployeeRepository.new(csv_file)

p repo
