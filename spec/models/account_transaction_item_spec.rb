require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountTransactionItem do
  before(:each) do
    @valid_attributes = {
      :account_id => 1, 
      :category => 'Debit', 
      :amount => 5
    }
  end

  it "should create a new instance given valid attributes" do
    AccountTransactionItem.create!(@valid_attributes)
  end
end
