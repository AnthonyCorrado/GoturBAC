class AddVenueNameToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :venue_name, :string
  end
end
