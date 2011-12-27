require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_group_types/show.html.erb" do
  include AccountGroupTypesHelper
  before(:each) do
    assigns[:account_group_type] = @account_group_type = stub_model(AccountGroupType)
  end

  it "renders attributes in <p>" do
    render
  end
end

