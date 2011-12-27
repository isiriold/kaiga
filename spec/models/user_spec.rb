require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :email => 'abc@abc.in',
      :login => 'username',
      :password => 'password',
      :password_confirmation => 'password'
    }
    @user = User.new(@valid_attributes)
    @user.company = mock_model(Company)
  end

  it "should create a new instance given valid attributes" do
    @user.save!
  end
end
