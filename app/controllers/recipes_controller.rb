require 'will_paginate/array'

class RecipesController < ApplicationController

  def index
    if !params[:q].blank?
        @recipes = EdamamApiWrapper.search(params[:q], 0, 100).paginate(:page => params[:page], :per_page => 10)
    end
  end



  def show
    @recipe = EdamamApiWrapper.show_details(params[:uri])
  end
end
