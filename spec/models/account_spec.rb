require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  before(:each) do
    @valid_attributes = {
      :name => 'An account'
    }
    @account = Account.new(@valid_attributes)    
    @account.account_group = mock_model(AccountGroup, :account_group_type_id => 5)  
    @account.company = mock_model(Company)
  end

  it "should create a new instance given valid attributes" do
    @account.save!
  end
  
  
  it "should be invalid if account group is missing" do
    @account = Account.new(@valid_attributes.delete(:key => :account_group))
    @account.should_not be_valid
  end

  it "should setup an opening balance for the current accounting period when created" do
    AccountingPeriod.set_up_accounting_period
    @account.opening_balance = 99.99
    @account.save
    AccountingPeriod.current_accounting_period.account_balances.find_by_account_id(@account.id).opening_balance == 99.99
  end
  
  it "should provide the opening balance for the current account period" do
    AccountingPeriod.set_up_accounting_period
    @account.opening_balance = 99.99
    @account.save
    @account.opening_balance.should eql(99.99)
  end
  
  after(:each) do
    Account.destroy_all
  end      
end
