require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_transactions/edit.html.erb" do
  include AccountTransactionsHelper
  
  before(:each) do
    assigns[:account_transaction] = @account_transaction = stub_model(AccountTransaction,
      :new_record? => false,
      :transaction_no => "value for transaction_no",
      :narrations => "value for narrations"
    )
  end

  it "renders the edit account_transaction form" do
    render
    
    response.should have_tag("form[action=#{account_transaction_path(@account_transaction)}][method=post]") do
      with_tag('input#account_transaction_transaction_no[name=?]', "account_transaction[transaction_no]")
      with_tag('input#account_transaction_narrations[name=?]', "account_transaction[narrations]")
    end
  end
end


