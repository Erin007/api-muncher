class RecipesController < ApplicationController

  def index
    if !params[:q].blank?
      @recipes = EdamamApiWrapper.search(params[:q])

    else
      @recipes = "Everything is broken"
    end
  end


#   def index
#   @data = SlackApiWrapper.listchannels
#   if @data != nil && @data != []
#     render status: :created
#   else
#     render status: :service_unavailable
#   end
# end

  def show
    @recipe = Recipe.find(params[:id].to_i)
  end
end
