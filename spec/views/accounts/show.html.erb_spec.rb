require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/show.html.erb" do
  include AccountsHelper
  before(:each) do
    assigns[:account] = @account = stub_model(Account,
      :name => "value for name",
      :account_group => mock_model(AccountGroup, :name => 'Group')
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/Group/)
  end
end

