class AddInfectedToSurvivors < ActiveRecord::Migration[5.2]
  def change
    add_column :survivors, :infected, :integer
  end
end
