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

  def find(index)
    @recipes[index]
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      name = row[0]
      description = row[1]
      rating = row[2]
      done = row[3] == "true" ? true : false
      prep_time = row[4]
      @recipes << Recipe.new(name, description, rating, done, prep_time)
    end
  end

  def save_in_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done?, recipe.prep_time]
      end
    end
  end
end
