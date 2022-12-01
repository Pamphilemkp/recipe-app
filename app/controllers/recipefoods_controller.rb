class RecipefoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @recipefoods = Recipefood.all
  end

  def show; end
end
