class RestaurantController < ApplicationController


    def index
        @restaurants = Restaurant.all
        @restaurants = apply_pagination @restaurants
        render json: @restaurants
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        render json: @dishes
    end

    def create
        restaurant = Restaurant.new(restaurant_params)
        if restaurant.save
            render json: {message:'Restaurant created successfully',data: restaurant}
        else
            render json:  restaurant.errors.full_messages
        end
    end

    def destroy
        restaurant = Restaurant.find(params[:id])
        if restaurant.destroy
            render json:{message: 'Restaurant deleted successfully',data: restaurant}
        else
            render json: restaurant.errors.full_messages
        end
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
