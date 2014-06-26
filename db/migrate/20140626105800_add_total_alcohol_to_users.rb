class AddTotalAlcoholToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_alcohol, :float
  end
end
