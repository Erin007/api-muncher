class RecipesController < ApplicationController

  def index
    if !params[:q].blank?
      if params[:from] == nil
        @recipes = EdamamApiWrapper.search(params[:q], 0)
        params[:from] = 10
        params[:to] = params[:from]+10
      else
        params[:from] = params[:from].to_i
        @recipes = EdamamApiWrapper.search(params[:search_term], params[:from])
        params[:from] += 10
        params[:to] = params[:from]+10
      end
    end
  end



  def show
    @recipe = EdamamApiWrapper.show_details(params[:uri])
  end
end
