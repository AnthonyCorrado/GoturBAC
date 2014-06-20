class UserDrinks < ActiveRecord::Migration
  def change
    create_table :user_drinks do |t|
        t.references :user, index: true
        t.references :drink, index: true
      t.timestamps
    end
  end
end
