class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.integer :weight
      t.string :avatar
      t.float :current_bac
      t.float :preferred_bac
      t.references :venue, index: true

      t.timestamps
    end
  end
end
