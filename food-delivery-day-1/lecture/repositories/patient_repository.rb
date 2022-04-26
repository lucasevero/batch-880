require 'csv'

class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file = csv_file
    @room_repository = room_repository
    @patients = []
    load_csv
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def add(patient) # instance of patient without an id
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << [id, name, cured, room_id]
      @patients.each do |patient|
        csv << [ patient.id, patient.name, patient.cured, pacient.room.id ]
      end
    end
  end

  def load_csv
    CSV.foreach(csv_file, headers: :first_row, header_converters: :symbol) do |row|
      # row used to be a array for the instance - > ['1', 'paul', 'true']
      # with theader_converters, it is now a hash - > { id: '1', name: 'paul', cured: 'false' }

      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean

      patient = Patient.new(row) # create a new patient
      room = @room_repository.find(row[:room_id].to_i) # get the room from the repo
      patient.room = room # assign it!

      @patients << patient
    end
  end
end
