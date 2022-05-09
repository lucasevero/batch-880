require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repository)
    @view = SessionView.new
    @repository = employee_repository
  end

  def log_in
    # PSEUDO CODE
    # 1. username?
    username = @view.ask_for_username
    # 2. password?
    password = @view.ask_for_password
    # 3. Find a employee with this username
    employee = @repository.find_by_username(username)
    # 4. Check if the password of the employee == to the one provided
    if employee && employee.password == password
      @view.signed_in
      employee
    else
      @view.wrong_credentials
      log_in
    end
  end
end
