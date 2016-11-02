class Recipe
  attr_reader :recipe, :id

    def initialize(recipe, id)
      @recipe = recipe
      @id = id
    end

end
