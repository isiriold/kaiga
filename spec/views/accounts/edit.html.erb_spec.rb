require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/edit.html.erb" do
  include AccountsHelper
  
  before(:each) do
    assigns[:account] = @account = stub_model(Account,
      :new_record? => false,
      :name => "value for name",
      :account_group => mock_model(AccountGroup),
      :opening_balance => 99.50      
    )
  end

  it "renders the edit account form" do
    render
    
    response.should have_tag("form[action=#{account_path(@account)}][method=post]") do
      with_tag('input#account_name[name=?]', "account[name]")
      with_tag('select#account_account_group_id[name=?]', "account[account_group_id]")
      with_tag("input#account_opening_balance[name=?]", "account[opening_balance]")            
    end
  end
end


