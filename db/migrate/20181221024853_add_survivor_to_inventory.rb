class AddSurvivorToInventory < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventories, :survivor, foreign_key: true
  end
end
