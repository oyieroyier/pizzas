class RestaurantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  protect_from_forgery with: :null_session
  # Show all restaurants.
  # ROUTE: /restaurants
  def index
    restaurants = Restaurant.all

    render json: restaurants, status: :ok
  end

  # Show each restaurant.
  # ROUTE: /restaurants/:id
  def show
    restaurant = find_restaurant

    render json: restaurant, status: :ok
  end

  # Delete a restaurant
  # ROUTE: /restaurants/:id
  def destroy
    restaurant = find_restaurant
    restaurant.destroy

    head :no_content
  end

  private

  def find_restaurant
    Restaurant.find(params[:id])
  end

  def not_found_response
    render json: { error: 'Restaurant not found' }, status: :not_found
  end
end
