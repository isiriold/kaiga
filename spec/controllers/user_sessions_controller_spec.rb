require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do
  it "should get new" do
    get :new
    response.should be_success
  end
  
  it "should create user session" do
    post :create, :user_session => { :login => "bjohnson", :password => "benrocks" }
    user_session = UserSession.find
    users(:ben).should eql(user_session.user)
    response.should be_redirect
  end
  
  it "should destroy user session" do
    delete :destroy
    UserSession.find.should be_nil
    response.should be_redirect
  end
end
