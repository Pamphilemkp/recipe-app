require 'rails_helper'

RSpec.describe "Recipefood", type: :request do
  before(:each) do
    @user = User.create(name: 'basit', created_at: Time.now, updated_at: Time.now,
                        )
    @food = Food.create(name: 'Salt', measurement_unit: 'kg', price: '10', created_at: Time.now,
                        updated_at: Time.now, user_id: @user.id)
    @recipe = Recipe.create(name: 'Pizza', preparation_time: '1 hour', cooking_time: '1 hour',
                            description: 'Today we are making pizza', public: true, created_at: Time.now,
                            updated_at: Time.now, user_id: @user.id)
    @recipe_food = Recipefood.create(quantity: 2, created_at: Time.now, updated_at: Time.now,
                                     food_id: @food.id, recipe_id: @recipe.id)
    get new_recipe_recipe_food_path(@recipe)
  end
  describe 'Testing methods of RecipeFood Controller' do
    it 'should have http status 200' do
      expect(response).to have_http_status :ok
    end
end
end