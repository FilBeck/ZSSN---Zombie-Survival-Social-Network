class ChangeSurvivorGenderToString < ActiveRecord::Migration[5.2]
  def change
    change_column :survivors, :gender, :string
  end
end
