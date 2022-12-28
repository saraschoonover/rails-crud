class RestaurantsController < ApplicationController
  # before_action :set_restaurants, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
     set_restaurants
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save
    redirect_to restaurant_path(restaurant)
  end

  def edit
    set_restaurants
  end

  def update
    set_restaurants
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    set_restaurants
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end
end
