require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe) # NOT A STRING
    @recipes << recipe
    save_in_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_in_csv
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      name, description = row[0], row[1]
      @recipes << Recipe.new(name, description)
    end
  end

  def save_in_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
