require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inventory_groups/show.html.erb" do
  include InventoryGroupsHelper
  before(:each) do
    assigns[:inventory_group] = @inventory_group = stub_model(InventoryGroup,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end

