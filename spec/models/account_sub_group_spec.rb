require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountSubGroup do
  before(:each) do
    @valid_attributes = {
      :name => 'Sub Group'
    }
    @account_sub_group = AccountSubGroup.new(@valid_attributes)
    @account_sub_group.parent_id = 1
    @account_sub_group.company = mock_model(Company)
  end

  it "should create a new instance given valid attributes" do
    @account_sub_group.save!
  end
    
  after(:each) do
    AccountSubGroup.destroy_all
  end    
end
