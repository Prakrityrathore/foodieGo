class RestaurantController < ApplicationController
    before_action :set_restaurant

    def index
        @restaurants = Restaurant.all
        @restaurants = apply_pagination @restaurants
        render_success data:{
            restaurants: @restaurant.as_api_response(:base)
            pagination: apply_pagination (@restaurants)
        }
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        render_success  data:{restaurant: @restaurant.as_api_response(:base) }
    end

    def create
        restaurant = Restaurant.new(restaurant_params)
        if restaurant.save
            render_success message:'Restaurant created successfully',data: {restaurant: restaurant.as_api_response(:base)}
        else
            render_error message:'Trouble creating new Restaurant', data: {error: restaurant.errors.full_messages}
        end
    end

    def destroy
        restaurant = Restaurant.find(params[:id])
        if restaurant.destroy
            render_success message: ' Restaurant deleted successfully',data: {restaurant: restaurant.as_api_response(:base)}
        else
            render_error message: 'Error while deleting', data: {error:restaurant.errors}
        end
    end

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name,
                                           :address,
                                           :email,
                                           :phone_number,
                                           :opening_hours,
                                           :home_deliveries,
                                           :accept_reservation)
    end

end
