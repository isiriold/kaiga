require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_transactions/index.html.erb" do
  include AccountTransactionsHelper
  
  before(:each) do
    assigns[:account_transactions] = [
      stub_model(AccountTransaction,
        :transaction_no => "value for transaction_no",
        :narrations => "value for narrations"
      ),
      stub_model(AccountTransaction,
        :transaction_no => "value for transaction_no",
        :narrations => "value for narrations"
      )
    ]
  end

  it "renders a list of account_transactions" do
    render
    response.should have_tag("tr>td", "value for transaction_no".to_s, 2)
    response.should have_tag("tr>td", "value for narrations".to_s, 2)
  end
end

