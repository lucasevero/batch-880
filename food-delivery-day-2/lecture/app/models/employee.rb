class Employee
  attr_accessor :id
  attr_reader :username, :password

  def initialize(attr = {})
    #  STATES
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
  end

  # BEHAVIOR
  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end

  def self.csv_headers
    ['id', 'username', 'password', 'role']
  end

  def prepare_to_save
    [@id, @username, @password, @role]
  end

  def self.prepare_to_load(row)
    row[:id] = row[:id].to_i
    row
  end
end
