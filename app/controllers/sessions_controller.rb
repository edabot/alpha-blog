class SessionsController < ApplicationController
  
  def new #renders a form
    
  end
  
  def create #handles form submission, starts session as logged in
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You are logged in"
      redirect_to user_path(user)
      
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy #stopping session, logging out
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end