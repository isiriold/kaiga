require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/index.html.erb" do
  include AccountsHelper
  
  before(:each) do
    assigns[:accounts] = [
      stub_model(Account,
        :name => "value for name",
        :account_group => mock_model(AccountGroup)
      ),
      stub_model(Account,
        :name => "value for name",
        :account_group => mock_model(AccountGroup)
      )
    ]
  end

  it "renders a list of accounts" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

