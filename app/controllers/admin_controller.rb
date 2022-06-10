class AdminController < ApplicationController
    def order
        if session[:user_id] && User.role == 1 
            @user = User.find_by(id: session[:user_id])    
        end
        @order = Order.all
    end        
    def edit 
        @order = Order.find(params[:id])
    end    
    def update    
        @order = Order.find(params[:id])
        @order.update(delivery_status: params[:order][:delivery_status])
        redirect_to admin_path
    end
    
end
