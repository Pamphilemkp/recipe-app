class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipefoods = Recipefood.where(recipe_id: @recipe.id).includes(:food)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:sucess] = 'Recipe successfully Created'
      redirect_to recipes_path
    else
      flash.now[:error] = 'Error creating recipe'
      render new_recipe_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipe_path
  end

  def public
    @public_recipes = Recipe.where(public: true).order('created_at DESC').includes(:user, :recipefoods)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
