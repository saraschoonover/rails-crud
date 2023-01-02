class RestaurantsController < ApplicationController
  before_action :set_restaurants, only: %i[show edit update destroy chef]
  def home
  end
  
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

  def top
    @restaurants = Restaurant.where(rating: 5)
  end

  def chef
    set_restaurants
    @chef_name = @restaurant.chef_name
  end

  def random

    @restaurant = Restaurant.all.sample


  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurants
    @restaurant = Restaurant.find(params[:id])
  end
end
