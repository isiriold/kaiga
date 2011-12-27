require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/inventory_groups/edit.html.erb" do
  include InventoryGroupsHelper
  
  before(:each) do
    assigns[:inventory_group] = @inventory_group = stub_model(InventoryGroup,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders the edit inventory_group form" do
    render
    
    response.should have_tag("form[action=#{inventory_group_path(@inventory_group)}][method=post]") do
      with_tag('input#inventory_group_name[name=?]', "inventory_group[name]")
      with_tag('input#inventory_group_description[name=?]', "inventory_group[description]")
    end
  end
end


