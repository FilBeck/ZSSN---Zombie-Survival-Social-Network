class CreateInfectionReports < ActiveRecord::Migration[5.2]
  def change
    create_table :infection_reports do |t|

      t.timestamps
    end
  end
end
