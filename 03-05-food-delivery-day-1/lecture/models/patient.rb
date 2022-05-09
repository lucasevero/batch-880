class Patient
  # belongs to a room
  attr_reader :name, :cured
  attr_accessor :room, :id # attr_reader + attr_writer

  def initialize(attr = {})
    # def initialize(name, cured) -> OLD WAY
    # Patient.new("Dion") -> Wrong number of arguments
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
