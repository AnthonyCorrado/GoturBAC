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
    current_user.user_drinks.clear
    session.delete(:remember_token)
    redirect_to root_path
  end




end
