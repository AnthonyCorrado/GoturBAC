class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :url
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
