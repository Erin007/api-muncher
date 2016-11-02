class Recipe
  attr_reader :recipe, :id, :label, :url, :ingredients, :image, :summary, :yield, :health_labels, :diet_labels

    def initialize(recipe, id, options = {})
      @recipe = recipe
      @id = id

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
