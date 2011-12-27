require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/new.html.erb" do
  include AccountsHelper
  
  before(:each) do
    assigns[:account] = stub_model(Account,
      :new_record? => true,
      :name => "value for name",
      :account_group => mock_model(AccountGroup),
      :opening_balance => 99.50
    )
  end

  it "renders new account form" do
    render
    
    response.should have_tag("form[action=?][method=post]", accounts_path) do
      with_tag("input#account_name[name=?]", "account[name]")
      with_tag("select#account_account_group_id[name=?]", "account[account_group_id]")
      with_tag("input#account_opening_balance[name=?]", "account[opening_balance]")      
    end
  end
end
