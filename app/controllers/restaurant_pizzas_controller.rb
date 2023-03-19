class RestaurantPizzasController < ApplicationController
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  # Create RestaurantPizzas
  # ROUTE: /restaurant_pizzas
  def create
    restaurant_pizzas = RestaurantPizza.create!(restaurant_pizzas_params)
    render json: restaurant_pizzas, status: :ok
  end

  private

  def render_unprocessable_entity(invalid)
    render json: {
             errors: invalid.record.errors,
           },
           status: :unprocessable_entity
  end

  def restaurant_pizzas_params
    params.permit(:price, :pizza_id, :restaurant_id)
  end
end
