class RecipesController < ApplicationController

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result
  end

  def show
  end
end
