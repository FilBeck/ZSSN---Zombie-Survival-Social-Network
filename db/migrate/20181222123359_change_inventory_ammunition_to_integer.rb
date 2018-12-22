class ChangeInventoryAmmunitionToInteger < ActiveRecord::Migration[5.2]
  def change
  	change_column :inventories, :ammunition, :integer
  end
end
