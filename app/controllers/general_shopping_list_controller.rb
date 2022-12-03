class GeneralShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])

    @total_item_to_buy = 0
    @missing_foods = []
    @total_price = 0

    @recipe.recipefoods.each do |ingredient|
      food = Food.find(ingredient.food_id)

      next if ingredient.quantity <= food.quantity

      @total_item_to_buy += 1
      @quantity = ingredient.quantity - food.quantity
      @missing_foods << ingredient
      @total_price += (ingredient.quantity - food.quantity) * food.price
    end
  end
end
