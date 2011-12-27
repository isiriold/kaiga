require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inventory_items/index.html.erb" do
  include InventoryItemsHelper
  
  before(:each) do
    assigns[:inventory_items] = [
      stub_model(InventoryItem,
        :name => "value for name",
        :lot_size => 1,
        :buy_price => 9.99,
        :sale_price => 9.99,
        :inventory_group_id => 1,
        :consumable => false,
        :discount_allowed => false,
        :inventory_unit_of_measurement_id => 1
      ),
      stub_model(InventoryItem,
        :name => "value for name",
        :lot_size => 1,
        :buy_price => 9.99,
        :sale_price => 9.99,
        :inventory_group_id => 1,
        :consumable => false,
        :discount_allowed => false,
        :inventory_unit_of_measurement_id => 1
      )
    ]
  end

  it "renders a list of inventory_items" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

