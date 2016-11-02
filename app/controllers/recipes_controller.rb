class RecipesController < ApplicationController

  def index
    #If a search is submitted
    if params[:commit] == "search"
      #If the user does a non-blank search
      if !params[:q].blank?
        data = Edamam_Api_Wrapper.search
      end

    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id].to_i)
  end
end
