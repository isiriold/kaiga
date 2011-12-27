require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_sub_groups/edit.html.erb" do
  include AccountSubGroupsHelper
  
  before(:each) do
    assigns[:account_sub_group] = @account_sub_group = stub_model(AccountSubGroup,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description",
      :parent_id => 1
    )
  end

  it "renders the edit account_sub_group form" do
    render
    
    response.should have_tag("form[action=#{account_sub_group_path(@account_sub_group)}][method=post]") do
      with_tag('input#account_sub_group_name[name=?]', "account_sub_group[name]")
      with_tag('textarea#account_sub_group_description[name=?]', "account_sub_group[description]")
      with_tag('select#account_sub_group_parent_id[name=?]', "account_sub_group[parent_id]")
    end
  end
end


