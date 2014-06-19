class AddDrinkTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :drink_time, :time
  end
end
