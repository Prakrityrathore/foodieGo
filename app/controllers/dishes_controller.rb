class DishesController < ApplicationController
    before_action :set_dish
    def index
        #restaurant = Restaurant.find(params[:id])
        dishes = apply_pagination dishes
        render json: dishes 
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
        current_dish = Dish.find(params[:id])
        if current_dish.update_attributes(update_dish_params)
            render json: {message: 'Dish is updated successfully', data: current_dish}
        else
            render json: {message: 'Error while updating', errors: current_dish.errors}
        end
    end

    def destroy
        current_dish = Dish.find(params[:id])
        if current_dish.destroy
            render json: {message: 'Dish is deleted successfully', data: dish}
        else
            render json: {message: 'Error while deleting', errors:  current_dish.errors}
        end
 
    end

    def set_dish
        dish = Dish.find(params[:id])
    end

    def dish_params
        params.require(:dish).permit(:name, :cuisine, :price, :ratings, :description)
    end

    def update_dish_params
        params.require(:dish).permit(:price, :ratings, :description)
    end
end
