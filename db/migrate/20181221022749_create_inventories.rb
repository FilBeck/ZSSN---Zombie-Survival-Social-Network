class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.references :survivor
      t.integer :water
      t.integer :food
      t.integer :medication
      t.string :ammunition
      t.string :integer

      t.timestamps
    end
  end
end
