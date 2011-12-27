require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountBalance do
  before(:each) do
    @valid_attributes = {
    }
    @account_balance = AccountBalance.new(@valid_attributes)      
    @account_balance.opening_balance = 10
    @account_balance.company = mock_model(Company)
    @account_balance.account = mock_model(Account)
    @account_balance.accounting_period = mock_model(AccountingPeriod)
  end

  it "should create a new instance given valid attributes" do
    @account_balance.save!
  end
  
  it "should be created when an account is created" 
  
  describe "associations" do
    
    it "should respond to account" do
      AccountBalance.reflect_on_association(:account).should_not be_nil
    end
  end
end
