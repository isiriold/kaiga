require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LedgersController do

  #Delete this example and add some real ones
  it "should use LedgersController" do
    controller.should be_an_instance_of(LedgersController)
  end

  before(:each) do
    do_login
  end

end
