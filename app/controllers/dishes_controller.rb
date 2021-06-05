class DishesController < ApplicationController
    before_action :get_restaurant
    before_action :set_dish, only: %i[update destroy]
    def index
        #restaurant = Restaurant.find(params[:id])
        @dishes = apply_pagination @restaurant.dishes
        render json: @dishes 
    end

    def create 
        dish = Dish.new(dish_params)
        if dish.save
            render json: {message:"Dish Created Successfully", data: dish}
        else
            render json: {message: "Error while creating dish", errors: dish.errors.full_messages}
        end
    end

    def update
        if @dish.update_attributes(update_dish_params)
            render json: {message: 'Dish is updated successfully', data: @dish}
        else
            render json: {message: 'Error while updating', errors: @dish.errors}
        end
    end

    def destroy
        if @dish.destroy
            render json: {message: 'Dish is deleted successfully', data: @dish}
        else
            render json: {message: 'Error while deleting', errors: @dish.errors}
        end
 
    end
    private

    def get_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    def set_dish
        @dish = @restaurant.dishes.find(params[:id])
    end

    def dish_params
        params.require(:dish).permit(:name, :cuisine, :price, :ratings, :description)
    end

    def update_dish_params
        params.require(:dish).permit(:price, :ratings, :description)
    end
end
