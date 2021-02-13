class AddLatitudeToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :latitude, :float
  end
end
