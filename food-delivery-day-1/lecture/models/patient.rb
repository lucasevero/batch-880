class Patient
  attr_accessor :id
  # belongs to a room

  # def initialize(name, cured) -> OLD WAY
    # Patient.new("Dion") -> Wrong number of arguments
  attr_reader :name, :cured
  attr_accessor :room # attr_reader + attr_writer

  def initialize(attr = {})
    # STATE
    # name
    # cured
    # .........
    @id = attr[:id]
    @name = attr[:name]
    @cured = attr[:cured] || false
    @room = attr[:room]
  end

  def cure!
    @cured = true
  end
end
