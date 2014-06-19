class AddUserAndDrinkToUserDrink < ActiveRecord::Migration
  def change
    add_reference :user_drinks, :user, index: true
    add_reference :user_drinks, :drink, index: true
  end
end
