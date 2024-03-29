class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]

def index
  @users = User.all
end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session_create # This method is inhereited from the applicaiton_controller
      redirect_to user_path(current_user), notice: "Drunk Person Added."
    else
      flash[:danger] = "Ya done goofed. Try Again."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "You seem different somehow."
      redirect_to user_path
    else
      flash[:danger] = "You screwed something up."
      redirect_to edit_user_path
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  protected
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :gender, :weight, :password, :avatar, :current_bac, :preferred_bac, :drink_ids => [])
  end
end


