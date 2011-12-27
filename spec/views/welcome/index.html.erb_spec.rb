require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/welcome/index" do
  before(:each) do
    render 'welcome/index'
  end
  
  it "should render successfully" do
    response.should be_success
    response.response_code == 200
  end
end
