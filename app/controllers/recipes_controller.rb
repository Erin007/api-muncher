class RecipesController < ApplicationController

  def index
    if !params[:q].blank?
      @recipes = EdamamApiWrapper.search(params[:q])
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
    @recipe = EdamamApiWrapper.search(params[:q])
  end
end
