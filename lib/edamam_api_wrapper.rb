require 'httparty'
require 'recipe'

class EdamamApiWrapper
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  BASE_URL = "https://api.edamam.com/search?q="
  URL_END = "&app_id=#{ID}&app_key=#{KEY}"
#Example url https://api.edamam.com/search?q=chocolate&app_id=a65baf98&app_key=d226eb661cfec1fbf393845bccd84589

  attr_reader :recipe, :id, :label, :url, :ingredients, :image, :summary, :yield, :health_labels, :diet_labels

  def initialize(recipe, id, options = {} )
    @recipe = recipe
    @id = id

    @label = options[:label]
    @url = options[:url]
    @ingredients = options[:ingredientlines]
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
           label: hit["recipe"]["label"],
           url: hit["recipe"]["uri"],
           ingredients: hit["recipe"]["ingredientlines"],
           image: hit["recipe"]["image"],
           summary: hit["recipe"]["summary"],
           yield: hit["recipe"]["yield"],
           health_labels: hit["recipe"]["healthLabels"],
           diet_labels: hit["recipe"]["dietLabels"]

           search_results << wrapper
         end

      return search_results

      end
      # if data.hits > 0

      #   data.hits.each do |hit|
      #       search_results<< hit.recipe
      #   end
      #
      # return search_results
      # else #The search results don't have any hits
      #   #Tell the user that there aren't any results for their search term
      # end
  end

end
# def self.list_ten(token = nil)
#   token ||= TOKEN #can take an optional token as a parameter if you want to pretend to be multiple users in your tests
#   url = BASE_URL + "channels.list?" + "token=#{token}" + "&pretty=1&exclude_archived=1"
#   data = HTTParty.get(url)
#   channels = []
#   if data["channels"]  # if the request was successful
#     data["channels"].each do |channel|
#
#       wrapper = Slack_Channel.new channel["name"], channel["id"] , purpose: channel["purpose"], is_archived: channel["is_archived"], members: channel["members"]
#       channels << wrapper
#     end
#    return channels
#   else
#    return nil
#   end
# end



  # "q": "chocolate",
  # "from": 0,
  # "to": 10,
  # "params":
