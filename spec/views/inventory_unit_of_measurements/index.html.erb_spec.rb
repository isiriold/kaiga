require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inventory_unit_of_measurements/index.html.erb" do
  include InventoryUnitOfMeasurementsHelper
  
  before(:each) do
    assigns[:inventory_unit_of_measurements] = [
      stub_model(InventoryUnitOfMeasurements,
        :branch_id => 1,
        :unit_name => "value for unit_name",
        :unit_symbol => "value for unit_symbol",
        :sub_unit_name => "value for sub_unit_name",
        :sub_unit_symbol => "value for sub_unit_symbol",
        :unit_value => 1
      ),
      stub_model(InventoryUnitOfMeasurements,
        :branch_id => 1,
        :unit_name => "value for unit_name",
        :unit_symbol => "value for unit_symbol",
        :sub_unit_name => "value for sub_unit_name",
        :sub_unit_symbol => "value for sub_unit_symbol",
        :unit_value => 1
      )
    ]
  end

  it "renders a list of inventory_unit_of_measurements" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for unit_name".to_s, 2)
    response.should have_tag("tr>td", "value for unit_symbol".to_s, 2)
    response.should have_tag("tr>td", "value for sub_unit_name".to_s, 2)
    response.should have_tag("tr>td", "value for sub_unit_symbol".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

