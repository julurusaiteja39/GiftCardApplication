class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.find_by(username: params[:session][:username])
        if @user && @user.authenticate(params[:session][:password]) && @user.role1 == 0
          session[:user_id] = @user.id
          flash[:notice] = "Logged in successfully."
          redirect_to '/sessions'
        elsif @user && @user.authenticate(params[:session][:password]) && @user.role1 == 1
          session[:user_id] = @user.id
          flash[:notice] = "Logged in successfully."
          redirect_to '/admin'
        else 
          flash[:notice] = "There was something wrong with your login details."
          render 'new'
        end
    end
       
    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have been logged out."
        redirect_to root_path
    end
end