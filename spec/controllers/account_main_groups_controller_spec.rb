require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountMainGroupsController do

  def mock_account_main_group(stubs={})
    @mock_account_main_group ||= mock_model(AccountMainGroup, stubs)
  end
  
  before(:each) do
    current_user = do_login
    current_user.should_receive(:company)
  end  
  
  describe "GET index" do
    it "assigns all account_main_groups as @account_main_groups" do
      AccountMainGroup.stub!(:find).with(:all).and_return([mock_account_main_group])
      get :index
      assigns[:account_main_groups].should == [mock_account_main_group]
    end
  end

  describe "GET show" do
    it "assigns the requested account_main_group as @account_main_group" do
      AccountMainGroup.stub!(:find).with("37").and_return(mock_account_main_group)
      get :show, :id => "37"
      assigns[:account_main_group].should equal(mock_account_main_group)
    end
  end

  describe "GET new" do
    it "assigns a new account_main_group as @account_main_group" do
      AccountMainGroup.stub!(:new).and_return(mock_account_main_group)
      get :new
      assigns[:account_main_group].should equal(mock_account_main_group)
    end
  end

  describe "GET edit" do
    it "assigns the requested account_main_group as @account_main_group" do
      AccountMainGroup.stub!(:find).with("37").and_return(mock_account_main_group)
      get :edit, :id => "37"
      assigns[:account_main_group].should equal(mock_account_main_group)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created account_main_group as @account_main_group" do
        AccountMainGroup.stub!(:new).with({'these' => 'params'}).and_return(mock_account_main_group(:save => true))
        post :create, :account_main_group => {:these => 'params'}
        assigns[:account_main_group].should equal(mock_account_main_group)
      end

      it "redirects to the created account_main_group" do
        AccountMainGroup.stub!(:new).and_return(mock_account_main_group(:save => true))
        post :create, :account_main_group => {}
        response.should redirect_to(account_main_group_url(mock_account_main_group))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved account_main_group as @account_main_group" do
        AccountMainGroup.stub!(:new).with({'these' => 'params'}).and_return(mock_account_main_group(:save => false))
        post :create, :account_main_group => {:these => 'params'}
        assigns[:account_main_group].should equal(mock_account_main_group)
      end

      it "re-renders the 'new' template" do
        AccountMainGroup.stub!(:new).and_return(mock_account_main_group(:save => false))
        post :create, :account_main_group => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested account_main_group" do
        AccountMainGroup.should_receive(:find).with("37").and_return(mock_account_main_group)
        mock_account_main_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :account_main_group => {:these => 'params'}
      end

      it "assigns the requested account_main_group as @account_main_group" do
        AccountMainGroup.stub!(:find).and_return(mock_account_main_group(:update_attributes => true))
        put :update, :id => "1", :account_main_group => {:these => 'params'}
        assigns[:account_main_group].should equal(mock_account_main_group)
      end

      it "redirects to the account_main_group" do
        AccountMainGroup.stub!(:find).and_return(mock_account_main_group(:update_attributes => true))
        put :update, :id => "1", :account_main_group => {:these => 'params'}
        response.should redirect_to(account_main_group_url(mock_account_main_group))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested account_main_group" do
        AccountMainGroup.should_receive(:find).with("37").and_return(mock_account_main_group)
        mock_account_main_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :account_main_group => {:these => 'params'}
      end

      it "assigns the account_main_group as @account_main_group" do
        AccountMainGroup.stub!(:find).and_return(mock_account_main_group(:update_attributes => false))
        put :update, :id => "1", :account_main_group => {:these => 'params'}
        assigns[:account_main_group].should equal(mock_account_main_group)
      end

      it "re-renders the 'edit' template" do
        AccountMainGroup.stub!(:find).and_return(mock_account_main_group(:update_attributes => false))
        put :update, :id => "1", :account_main_group => {:these => 'params'}
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested account_main_group" do
      AccountMainGroup.should_receive(:find).with("37").and_return(mock_account_main_group)
      mock_account_main_group.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the account_main_groups list" do
      AccountMainGroup.stub!(:find).and_return(mock_account_main_group(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(account_main_groups_url)
    end
  end

end
