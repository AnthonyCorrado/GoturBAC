class DrinksController < ApplicationController

  before_action :authenticate_user, :only => [:new, :create, :edit, :update, :destroy]
  before_action :set_drink, :only => [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @drinks = @user.drinks
  end

  def new
    @user_drink = UserDrink.new
  end

# Seem to be creating both a new drink and a new user drink. Likely need to rework this action
# Also isn't accepting drink attributes
   def create
    # Drink.first.user_drinks.create(user: User.first)
    user_drink = current_user.user_drinks.new(user_id: current_user.id, drink_id: user_drink_params[:drink_id])
    if user_drink.save
      redirect_to user_path(current_user)
      flash[:success] = "Another Drink Down!"
    else
      flash[:danger] = "Drink couldn't be added"
      render :new
    end
  end


  def show
  end

  def destroy
    UserDrink.destroy_all
  end


protected
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_drink
    @drink = Drink.find(params[:id])
  end

  def user_drink_params
    # :drink_name, :alcohol, :type, :user_id
    params.require(:user_drink).permit(:drink_id)
  end

end