require File.dirname(__FILE__) + '/../spec_helper'

describe AccountGroup do
  before(:each) do
    @account_group = AccountGroup.new(:name => 'An acct group')
    @account_group.company = mock_model(Company)
  end

  it "should be valid" do
    @account_group.should be_valid
  end
  
  it "should be valid if it belongs to an account group type" do
    @account_group.account_group_type = AccountGroupType.new
    @account_group.should be_valid
  end
  
  after(:each) do
    AccountGroup.destroy_all
  end      
end
