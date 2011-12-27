require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/account_transactions/show.html.erb" do
  include AccountTransactionsHelper
  before(:each) do
    assigns[:account_transaction] = @account_transaction = stub_model(AccountTransaction,
      :transaction_no => "value for transaction_no",
      :narrations => "value for narrations"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ transaction_no/)
    response.should have_text(/value\ for\ narrations/)
  end
end

