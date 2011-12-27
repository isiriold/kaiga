require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inventory_items/show.html.erb" do
  include InventoryItemsHelper
  before(:each) do
    assigns[:inventory_item] = @inventory_item = stub_model(InventoryItem,
      :name => "value for name",
      :lot_size => 1,
      :buy_price => 9.99,
      :sale_price => 9.99,
      :inventory_group_id => 1,
      :consumable => false,
      :discount_allowed => false,
      :inventory_unit_of_measurement_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/1/)
    response.should have_text(/false/)
    response.should have_text(/false/)
    response.should have_text(/1/)
  end
end

