class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.role1 = 0
    if @user.save
      flash[:notice] = "User created."
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    if !logged_in?
      
    else
    end
  end
 private
  
  def user_params
    params.require(:user).permit(:username, :email, :password,:confirm_password)
  end
end
