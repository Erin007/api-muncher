require 'httparty'
require 'recipe'

class EdamamApiWrapper
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  BASE_URL = "https://api.edamam.com/search?q="
  URL_END = "&app_id=#{ID}&app_key=#{KEY}"
#Example url https://api.edamam.com/search?q=chocolate&app_id=a65baf98&app_key=d226eb661cfec1fbf393845bccd84589

  attr_reader :recipe, :label, :uri, :url, :ingredients, :image, :summary, :yield, :health_labels, :diet_labels

  def initialize(recipe, options = {} )
    @recipe = recipe

    @uri = options[:uri]
    @label = options[:label]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @image = options[:image]
    @summary = options[:summary]
    @yield = options[:yield]
    @health_labels = options[:health_labels]
    @diet_labels = options[:diet_labels]
  end

  def self.search(q)

      url = BASE_URL + q + URL_END #this will go to the search results for q
      #get the search results for query q
      data = HTTParty.get(url)
      #if the search results, include hits
      if data["hits"]
      # store all of the hits in search results
        search_results = []
        data["hits"].each do |hit|
          wrapper = Recipe.new hit["id"], hit["recipe"],
           uri: hit["recipe"]["uri"], #this is the unique identifier for the recipe
           label: hit["recipe"]["label"],
           url: hit["recipe"]["url"],
           ingredients: hit["recipe"]["ingredientLines"],
           image: hit["recipe"]["image"],
           summary: hit["recipe"]["summary"],
           yield: hit["recipe"]["yield"],
           health_labels: hit["recipe"]["healthLabels"],
           diet_labels: hit["recipe"]["dietLabels"]

           search_results << wrapper
         end

      return search_results

      end
  end

#new method to show one that works like the search, but use r = uri rather than q = search term

end
