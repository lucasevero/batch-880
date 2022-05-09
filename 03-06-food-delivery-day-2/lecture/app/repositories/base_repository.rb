require_relative '../models/customer'
require 'csv'

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    load_csv if File.exists?(@csv_file)
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def create(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row = @model.prepare_to_load(row)
      @elements << @model.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << @model.csv_headers
      @elements.each do |element|
        csv << element.prepare_to_save
      end
    end
  end
end
