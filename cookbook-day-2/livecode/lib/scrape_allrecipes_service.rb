require 'open-uri'
require 'nokogiri'

class ScrapeAllrecipesService
  def initialize(ingredient)
    @url = "https://www.allrecipes.com/search/results/?search=#{ingredient}"
  end

  def call
    html_file = URI.open(@url).read
    html_doc = Nokogiri::HTML(html_file)
    recipes = []

    names = html_doc.search('.card__title').first(5).map do |elem|
      elem.text.strip
    end
    names.each do |name|
      recipes << { name: name }
    end

    descriptions = html_doc.search('.card__summary').first(5).map do |elem|
      elem.text.strip
    end
    descriptions.each_with_index do |description, index|
      recipes[index][:description] = description
    end

    ratings = html_doc.search('.review-star-text').first(5).map do |elem|
      elem.text.strip.match(/\d\.?\d?/)[0].to_f
    end
    ratings.each_with_index do |rating, index|
      recipes[index][:rating] = rating
    end

    links = html_doc.search('.card__detailsContainer .card__titleLink').first(5).map do |elem|
      elem.attribute("href").value
    end
    links.each_with_index do |link, index|
      recipes[index][:link] = link
    end
    recipes
  end

  def get_prep_time(pre_time_url)
    html_file = URI.open(pre_time_url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search(".recipe-meta-item").each do |elem|
      if elem.search(".recipe-meta-item-header")[0].text.strip == "total:"
        return elem.search(".recipe-meta-item-body")[0].text.strip
      end
    end
  end
end
