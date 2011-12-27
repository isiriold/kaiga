require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inventory_unit_of_measurements/show.html.erb" do
  include InventoryUnitOfMeasurementsHelper
  before(:each) do
    assigns[:inventory_unit_of_measurements] = @inventory_unit_of_measurements = stub_model(InventoryUnitOfMeasurements,
      :branch_id => 1,
      :unit_name => "value for unit_name",
      :unit_symbol => "value for unit_symbol",
      :sub_unit_name => "value for sub_unit_name",
      :sub_unit_symbol => "value for sub_unit_symbol",
      :unit_value => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ unit_name/)
    response.should have_text(/value\ for\ unit_symbol/)
    response.should have_text(/value\ for\ sub_unit_name/)
    response.should have_text(/value\ for\ sub_unit_symbol/)
    response.should have_text(/1/)
  end
end

