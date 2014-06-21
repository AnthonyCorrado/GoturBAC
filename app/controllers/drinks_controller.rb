class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def show
  end

  def new
    @drink = Drink.new
  end

   def create
    @drink = @Drink.user_drinks.new(drink_params.merge(user: current_user))
    if @drink.save
      redirect_to drink_path
      flash[:success] = "Drink Added"
    else
      flash[:danger] = "Drink couldn't be added"
      render :new
    end
  end

  def destroy
    @drink.destroy
    redirect_to new_drink_path
  end
end