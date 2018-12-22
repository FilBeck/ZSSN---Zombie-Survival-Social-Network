class AddIdToInfectionReportAttributes < ActiveRecord::Migration[5.2]
  def change
	rename_column :infection_reports, :reporter, :reporter_id
  	rename_column :infection_reports, :survivor_reported, :survivor_reported_id
  end
end
