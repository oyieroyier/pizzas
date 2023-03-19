class PizzasController < ApplicationController
  # Display all pizzas
  # ROUTE: /pizzas
  def index
    pizzas = Pizza.all
    render json: pizzas, status: :ok
  end
end
