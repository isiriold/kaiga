require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountMainGroup do
  before(:each) do
    @valid_attributes = {
      :name => 'Main Group'
    }
    @account_main_group = AccountMainGroup.new(@valid_attributes)
    @account_main_group.account_group_type_id = 1
    @account_main_group.company = mock_model(Company)
  end

  it "should create a new instance given valid attributes" do
    @account_main_group.save!
  end
    
  after(:each) do
    AccountMainGroup.destroy_all
  end
end
