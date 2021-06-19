class OrdersController < ApplicationController
    before_action :get_restaurant, only: %i[index show create]

    def index
        @orders = apply_pagination @restaurant.orders
        render_success data: {
            orders: @orders.as_api_response(:base),
            pagination: pagination(@orders)
        }
    end

    def show
        @order = @restaurant.orders.find(params[:id])
        render_success(data: {order: @order.as_api_response(:base)})
    end

    def create
        order = @restaurant.orders.build(order_params)
        if order.save
            render json: {message:"Order Created Successfully", data: order}
        else
            render json: {message: "Error while creating order", errors: order.errors.full_messages}
        end

    end

    private
    def get_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def order_params
        params.require(:order).permit(:delivery_address,
                                      :phone_number,
                                      order_items_attributes: [
                                        :dish_id,
                                        :quantity,
                                        :total_price,
                                        :payment_method
                                        ])
    end

end
