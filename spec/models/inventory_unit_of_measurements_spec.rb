require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InventoryUnitOfMeasurements do
  before(:each) do
    @valid_attributes = {
      :branch_id => 1,
      :unit_name => "value for unit_name",
      :unit_symbol => "value for unit_symbol",
      :sub_unit_name => "value for sub_unit_name",
      :sub_unit_symbol => "value for sub_unit_symbol",
      :unit_value => 1
    }
  end

  it "should create a new instance given valid attributes" do
    InventoryUnitOfMeasurements.create!(@valid_attributes)
  end
end
