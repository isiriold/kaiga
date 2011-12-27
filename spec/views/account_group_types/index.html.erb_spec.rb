require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_group_types/index.html.erb" do
  include AccountGroupTypesHelper
  
  before(:each) do
    assigns[:account_group_types] = [
      stub_model(AccountGroupType),
      stub_model(AccountGroupType)
    ]
  end

  it "renders a list of account_group_types" do
    render
  end
end

