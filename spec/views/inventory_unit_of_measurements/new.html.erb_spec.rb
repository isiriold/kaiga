require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inventory_unit_of_measurements/new.html.erb" do
  include InventoryUnitOfMeasurementsHelper
  
  before(:each) do
    assigns[:inventory_unit_of_measurements] = stub_model(InventoryUnitOfMeasurements,
      :new_record? => true,
      :branch_id => 1,
      :unit_name => "value for unit_name",
      :unit_symbol => "value for unit_symbol",
      :sub_unit_name => "value for sub_unit_name",
      :sub_unit_symbol => "value for sub_unit_symbol",
      :unit_value => 1
    )
  end

  it "renders new inventory_unit_of_measurements form" do
    render
    
    response.should have_tag("form[action=?][method=post]", inventory_unit_of_measurements_path) do
      with_tag("input#inventory_unit_of_measurements_branch_id[name=?]", "inventory_unit_of_measurements[branch_id]")
      with_tag("input#inventory_unit_of_measurements_unit_name[name=?]", "inventory_unit_of_measurements[unit_name]")
      with_tag("input#inventory_unit_of_measurements_unit_symbol[name=?]", "inventory_unit_of_measurements[unit_symbol]")
      with_tag("input#inventory_unit_of_measurements_sub_unit_name[name=?]", "inventory_unit_of_measurements[sub_unit_name]")
      with_tag("input#inventory_unit_of_measurements_sub_unit_symbol[name=?]", "inventory_unit_of_measurements[sub_unit_symbol]")
      with_tag("input#inventory_unit_of_measurements_unit_value[name=?]", "inventory_unit_of_measurements[unit_value]")
    end
  end
end


