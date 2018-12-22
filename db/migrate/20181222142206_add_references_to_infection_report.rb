class AddReferencesToInfectionReport < ActiveRecord::Migration[5.2]
  def change
  	add_column :infection_reports, :reporter, :integer
  	add_column :infection_reports, :survivor_reported, :integer
  end
end
