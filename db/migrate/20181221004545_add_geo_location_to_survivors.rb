class AddGeoLocationToSurvivors < ActiveRecord::Migration[5.2]
  def change
    add_column :survivors, :geo_location, :text
  end
end
