require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inventory_items/new.html.erb" do
  include InventoryItemsHelper
  
  before(:each) do
    assigns[:inventory_item] = stub_model(InventoryItem,
      :new_record? => true,
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

  it "renders new inventory_item form" do
    render
    
    response.should have_tag("form[action=?][method=post]", inventory_items_path) do
      with_tag("input#inventory_item_name[name=?]", "inventory_item[name]")
      with_tag("input#inventory_item_lot_size[name=?]", "inventory_item[lot_size]")
      with_tag("input#inventory_item_buy_price[name=?]", "inventory_item[buy_price]")
      with_tag("input#inventory_item_sale_price[name=?]", "inventory_item[sale_price]")
      with_tag("input#inventory_item_inventory_group_id[name=?]", "inventory_item[inventory_group_id]")
      with_tag("input#inventory_item_consumable[name=?]", "inventory_item[consumable]")
      with_tag("input#inventory_item_discount_allowed[name=?]", "inventory_item[discount_allowed]")
      with_tag("input#inventory_item_inventory_unit_of_measurement_id[name=?]", "inventory_item[inventory_unit_of_measurement_id]")
    end
  end
end


