class CustomerController < ApplicationController

    def create 
        customer = Customer.new(customer_params)
        if customer.save
            render json: {message:'Customer created successfully',data: customer}
        else
            render json:  customer.errors.full_messages
        end
    end
    
    def customer_params
        params.require(:customer).permit(:order_id, :name, :delivery_address, :phone_number, :payment_method)
    end        

end