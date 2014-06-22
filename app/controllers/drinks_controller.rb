class DrinksController < ApplicationController

  before_action :authenticate_user, :only => [:new, :create, :edit, :update, :destroy]
  before_action :set_drink, :only => [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @drinks = @user.drinks
  end

  def new
    @drink = Drink.new
  end

# Seem to be creating both a new drink and a new user drink. Likely need to rework this action
   def create
    @drink = Drink.new(drink_params)
    if @drink.save
      @user.drinks << @drink
      redirect_to user_path(current_user)
      flash[:success] = "Drink Added"
    else
      flash[:danger] = "Drink couldn't be added"
      render :new
    end
  end


  def show
  end

  def destroy
    @drink.destroy
    redirect_to new_drink_path
  end


protected
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_drink
    @drink = Drink.find(params[:id])
  end

  def drink_params
    params.require(:drink).permit(:name, :alcohol, :type, :user_id)
  end

end