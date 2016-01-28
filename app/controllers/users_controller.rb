class UsersController < ApplicationController
  def index
    @users = User.all
  end 
 
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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
    
  end
  
  def show
    @user = User.find(params[:id])
    
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  
  
end