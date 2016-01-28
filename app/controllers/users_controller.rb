class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save  #successfully create user
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to articles_path
    else  #fail, then show again w messages
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  
  
end