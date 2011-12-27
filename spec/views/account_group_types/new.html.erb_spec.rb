require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_group_types/new.html.erb" do
  include AccountGroupTypesHelper
  
  before(:each) do
    assigns[:account_group_type] = stub_model(AccountGroupType,
      :new_record? => true
    )
  end

  it "renders new account_group_type form" do
    render
    
    response.should have_tag("form[action=?][method=post]", account_group_types_path) do
    end
  end
end


