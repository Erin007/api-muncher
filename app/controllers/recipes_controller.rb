class RecipesController < ApplicationController

  def index
    if !params[:q].blank?
        @recipes = EdamamApiWrapper.search(params[:q], 0)
        @recipes2 = EdamamApiWrapper.search(params[:q], 10)
        @recipes3 = EdamamApiWrapper.search(params[:q], 20)
        @recipes4 = EdamamApiWrapper.search(params[:q], 30)
        @recipes5 = EdamamApiWrapper.search(params[:q], 40)
        @recipes6 = EdamamApiWrapper.search(params[:q], 50)
        @recipes7 = EdamamApiWrapper.search(params[:q], 60)
        @recipes8 = EdamamApiWrapper.search(params[:q], 70)
        @recipes9 = EdamamApiWrapper.search(params[:q], 80)
        @recipes10 = EdamamApiWrapper.search(params[:q], 90)


        #.paginate(:page => params[:page], :per_page => 10)
    end
  end



  def show
    @recipe = EdamamApiWrapper.show_details(params[:uri])
  end
end
