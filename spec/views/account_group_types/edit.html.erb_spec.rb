require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_group_types/edit.html.erb" do
  include AccountGroupTypesHelper
  
  before(:each) do
    assigns[:account_group_type] = @account_group_type = stub_model(AccountGroupType,
      :new_record? => false
    )
  end

  it "renders the edit account_group_type form" do
    render
    
    response.should have_tag("form[action=#{account_group_type_path(@account_group_type)}][method=post]") do
    end
  end
end


