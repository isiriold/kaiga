require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inventory_groups/index.html.erb" do
  include InventoryGroupsHelper
  
  before(:each) do
    assigns[:inventory_groups] = [
      stub_model(InventoryGroup,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(InventoryGroup,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of inventory_groups" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end

