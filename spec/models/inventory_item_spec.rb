require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InventoryItem do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :lot_size => 1,
      :buy_price => 9.99,
      :sale_price => 9.99,
      :inventory_group_id => 1,
      :consumable => false,
      :discount_allowed => false,
      :inventory_unit_of_measurement_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    InventoryItem.create!(@valid_attributes)
  end
end
