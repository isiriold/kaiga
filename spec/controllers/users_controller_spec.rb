require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do

  it "should get new" do
    get :new
    response.should be_success
  end
  
  it "should create user" do
    lambda do
      post :create, :user => { :login => "ben_123", :password => "benrocks", :password_confirmation => "benrocks", :email => 'abc@abc.in' }
      response.should be_redirect    
    end.should change(User, :count).by(1)    
  end
  
  it "should show user" do
    do_login
    get :show
    response.should be_success
  end

  it "should get edit" do
    current_user = do_login
    get :edit, :id => current_user.id
    response.should be_success
  end

  it "should update user" do
    current_user = do_login
    put :update, :id => current_user.id, :user => { }
    response.should be_redirect
  end

end
