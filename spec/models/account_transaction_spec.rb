require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountTransaction do
  before(:each) do
    @valid_attributes = {
      :transaction_no => "value for transaction_no",
      :transaction_date => Date.today,
      :narrations => "value for narrations"
    }
  end

  it "should create a new instance given valid attributes" do
    AccountingPeriod.set_up_accounting_period  
    AccountTransaction.create!(@valid_attributes)
  end
end
