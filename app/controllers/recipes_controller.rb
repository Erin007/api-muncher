class RecipesController < ApplicationController
  def search
    @q = Recipe.ransack(params[:q])
  end

  def index
  end

  def show
  end
end
