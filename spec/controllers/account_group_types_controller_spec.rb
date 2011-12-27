require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountGroupTypesController do

  def mock_account_group_type(stubs={})
    @mock_account_group_type ||= mock_model(AccountGroupType, stubs)
  end

  before(:each) do
    do_login
  end
  
  describe "GET index" do
    it "assigns all account_group_types as @account_group_types" do
      AccountGroupType.stub!(:find).with(:all).and_return([mock_account_group_type])
      get :index
      assigns[:account_group_types].should == [mock_account_group_type]
    end
  end

  describe "GET show" do
    it "assigns the requested account_group_type as @account_group_type" do
      AccountGroupType.stub!(:find).with("37").and_return(mock_account_group_type)
      get :show, :id => "37"
      assigns[:account_group_type].should equal(mock_account_group_type)
    end
  end

  describe "GET new" do
    it "assigns a new account_group_type as @account_group_type" do
      AccountGroupType.stub!(:new).and_return(mock_account_group_type)
      get :new
      assigns[:account_group_type].should equal(mock_account_group_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested account_group_type as @account_group_type" do
      AccountGroupType.stub!(:find).with("37").and_return(mock_account_group_type)
      get :edit, :id => "37"
      assigns[:account_group_type].should equal(mock_account_group_type)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created account_group_type as @account_group_type" do
        AccountGroupType.stub!(:new).with({'these' => 'params'}).and_return(mock_account_group_type(:save => true))
        post :create, :account_group_type => {:these => 'params'}
        assigns[:account_group_type].should equal(mock_account_group_type)
      end

      it "redirects to the created account_group_type" do
        AccountGroupType.stub!(:new).and_return(mock_account_group_type(:save => true))
        post :create, :account_group_type => {}
        response.should redirect_to(account_group_type_url(mock_account_group_type))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved account_group_type as @account_group_type" do
        AccountGroupType.stub!(:new).with({'these' => 'params'}).and_return(mock_account_group_type(:save => false))
        post :create, :account_group_type => {:these => 'params'}
        assigns[:account_group_type].should equal(mock_account_group_type)
      end

      it "re-renders the 'new' template" do
        AccountGroupType.stub!(:new).and_return(mock_account_group_type(:save => false))
        post :create, :account_group_type => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested account_group_type" do
        AccountGroupType.should_receive(:find).with("37").and_return(mock_account_group_type)
        mock_account_group_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :account_group_type => {:these => 'params'}
      end

      it "assigns the requested account_group_type as @account_group_type" do
        AccountGroupType.stub!(:find).and_return(mock_account_group_type(:update_attributes => true))
        put :update, :id => "1"
        assigns[:account_group_type].should equal(mock_account_group_type)
      end

      it "redirects to the account_group_type" do
        AccountGroupType.stub!(:find).and_return(mock_account_group_type(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(account_group_type_url(mock_account_group_type))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested account_group_type" do
        AccountGroupType.should_receive(:find).with("37").and_return(mock_account_group_type)
        mock_account_group_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :account_group_type => {:these => 'params'}
      end

      it "assigns the account_group_type as @account_group_type" do
        AccountGroupType.stub!(:find).and_return(mock_account_group_type(:update_attributes => false))
        put :update, :id => "1"
        assigns[:account_group_type].should equal(mock_account_group_type)
      end

      it "re-renders the 'edit' template" do
        AccountGroupType.stub!(:find).and_return(mock_account_group_type(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested account_group_type" do
      AccountGroupType.should_receive(:find).with("37").and_return(mock_account_group_type)
      mock_account_group_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the account_group_types list" do
      AccountGroupType.stub!(:find).and_return(mock_account_group_type(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(account_group_types_url)
    end
  end

end
