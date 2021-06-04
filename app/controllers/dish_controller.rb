class DishController < ApplicationController
    before_action :set_dish
    def index
        restaurant = Restaurant.find(params[:id])
        dishes = apply_pagination restaurant.dishes
        render json: data:{
            dishes: dishes.as_api_response(:base),
            pagination: pagination(dishes)
        }
    end

    def create 
        dish = Dish.new(dish_params)
        if dish.save
            render json: message:"Dish Created Successfully", data:{dish: dish.as_api_response(:base)}
        else
            render_error message: "Error while creating dish", data: {error:dish.errors}
        end
    end

    def update
        current_dish = Dish.find(params[:id])
        if current_dish.update_attributes(update_dish_params)
            render json: message: 'Dish is updated successfully', data:{dish: current_dish.as_api_response(:base)}
        else
            render_error message: 'Error while updating', data: {error:current_dish.errors}
        end
    end

    def destroy
        current_dish = Dish.find(params[:id])
        if current_dish.destroy
            render json: message: 'Dish is deleted successfully', data:{dish: current_dish.as_api_response(:base)}
        else
            render_error message: 'Error while deleting', data: {error:current_dish.errors}
        end
 
    end

    def set_dish
        @dish = Dish.find(params[:id])
    end

    def dish_params
        params.require(:dish).permit(:name, :cuisine, :price, :ratings, :description)
    end

    def update_dish_params
        params.require(:dish).permit(:price, :ratings, :description)
    end
end
