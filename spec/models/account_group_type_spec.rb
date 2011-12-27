require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountGroupType do
  before(:each) do
    @valid_attributes = {
      :name => 'GroupType'
    }
    @account_group_type = AccountGroupType.new(@valid_attributes)
    @account_group_type.company = mock_model(Company)
  end

  it "should create a new instance given valid attributes" do
    @account_group_type.save!
  end
  
  describe "associations" do
    
    it "should respond to account groups" do
      AccountGroupType.reflect_on_association(:account_groups).should_not be_nil
    end
  end    
  
end
