require_relative 'patient'

class Room
  # has many patients
  attr_accessor :id

  class FullRoomError < Exception; end

  def initialize(attr = {})
    # State
    # - capacity
    # - patients

    @id = attr[:id]
    @capacity = attr[:capacity]
    @patients = attr[:patients] || []
  end

  def full?
    @patients.length >= @capacity
  end

  def add_patient(patient)
    if full?
      # DO SOMETHING
      raise FullRoomError, 'This room is full'
    else
      @patients << patient
      patient.room = self
    end
  end
end

room1 = Room.new(capacity: 2)

boris = Patient.new(name: 'boris', cured: false)
room1.add_patient(boris)

dion = Patient.new( name: 'dion', blood_type: 'a' )
room1.add_patient(dion)

begin
  lucas = Patient.new(name: 'lucas')
  room1.add_patient(lucas)
rescue Room::FullRoomError
  puts 'sorry this room is full'
end


# Ask for the patient, what room is he in ??????
p "I'm still working"
