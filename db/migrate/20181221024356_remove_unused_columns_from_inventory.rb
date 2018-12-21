class RemoveUnusedColumnsFromInventory < ActiveRecord::Migration[5.2]
  def change
    remove_column :inventories, :integer
    remove_column :inventories, :survivor
  end
end
