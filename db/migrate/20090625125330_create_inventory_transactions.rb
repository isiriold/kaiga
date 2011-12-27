class CreateInventoryTransactions < ActiveRecord::Migration
  def self.up
    create_table :inventory_transactions do |t|
      t.references :branch
      t.references :inventory_item
      t.string :transaction_type #Account or PureInventory
      t.references :account
      t.date :transaction_date
      t.integer :quantity 
      t.decimal :cost
      t.decimal :total_cost, :precision => 8, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :inventory_transactions
  end
end
