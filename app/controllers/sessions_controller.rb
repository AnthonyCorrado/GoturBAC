class SessionsController < ApplicationController

  def new
  end

  def create
   @user = User.where(name: params[:session][:name]).first

    if @user && @user.authenticate(params[:session][:password])
      session_create
      flash[:success] = "You have successfully logged in."
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Invalid login/password combination. Please try again."
      render :new
    end
  end

  def destroy
    session.delete(:remember_token)
    # I really want to figure out how to make the below message personalized.
    # flash.now[:goodbye] = "Goodbye. Come back soon."
    redirect_to root_path
  end


end
