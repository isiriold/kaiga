class InventoryItem < ActiveRecord::Base
  belongs_to :branch
  validates_presence_of :name, :inventory_group_id, :inventory_unit_of_measurement_id
  validates_numericality_of :current_quantity, :buy_price, :sale_price, :lot_size
  attr_accessible :name, :lot_size, :buy_price, :sale_price, :consumable, :discount_allowed
end
