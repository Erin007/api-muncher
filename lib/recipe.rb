class Recipe
  attr_reader :recipe, :uri, :label, :url, :ingredients, :image, :summary, :yield, :health_labels, :diet_labels

    def initialize(recipe, id, options = {})
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


end

# hey, Erin. you were thinking about how to show one recipe on the show page. there are great notes that charles wrote in the main room. your next step is to go to postman and see what's up with the r parameter 
