class CreateInventoryItems < ActiveRecord::Migration
  def self.up
    create_table :inventory_items do |t|
      t.references :branch    
      t.string :name
      t.integer :lot_size
      t.decimal :buy_price, :precision => 8, :scale => 2 
      t.decimal :sale_price, :precision => 8, :scale => 2
      t.references :inventory_group
      t.boolean :consumable
      t.boolean :discount_allowed
      t.references :inventory_unit_of_measurement
      t.integer :current_quantity

      t.timestamps
    end
    
    add_index :inventory_items, :branch_id
    add_index :inventory_items, :inventory_group_id
  end

  def self.down
    drop_table :inventory_items
  end
end
