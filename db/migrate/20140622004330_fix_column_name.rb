class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :drinks, :name, :drink_name
  end
end
