class UserDrinks < ActiveRecord::Migration
  def change
    create_table :user_drinks do |t|

      t.timestamps
    end
  end
end
