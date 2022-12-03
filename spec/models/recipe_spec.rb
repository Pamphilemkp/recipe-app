require 'rails_helper'

RSpec.describe 'RecipeFood', type: :model do
    before(:each) do
    #   @user = User.create(name: 'basit', email: 'allahabdshah148@gmail.com', password: '123456')
      @recipe = Recipe.create(name: 'cookies', preparation_time: '2', cooking_time: '1', description: 'chocolat cookies', public: true, user: @user)
      @food = Food.create(name: 'chocolate', measurement_unit: 'g', price: 12, user: @user)
      @recipe_food = Recipefood.create(quantity: 2, recipe: @recipe.id, food: @food.id)
    end
  
    after(:each) do
      Recipe.destroy_all
      Food.destroy_all
      Recipefood.destroy_all
    #   User.destroy_all
    end
  
    it 'should create a recipefood' do
    #   expect(@recipe_food).to be_valid
      expect(@recipe_food.quantity).to eq 2
      expect(@recipe_food.recipe).to eq @recipe.id
      expect(@recipe_food.food).to eq @food.id
    end
  end