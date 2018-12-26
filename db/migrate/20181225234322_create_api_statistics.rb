class CreateApiStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :api_statistics do |t|

      t.timestamps
    end
  end
end
