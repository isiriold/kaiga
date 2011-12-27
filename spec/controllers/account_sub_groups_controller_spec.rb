require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountSubGroupsController do

  def mock_account_sub_group(stubs={})
    @mock_account_sub_group ||= mock_model(AccountSubGroup, stubs)
  end
  
  before(:each) do
    do_login
  end  
  
  describe "GET index" do
    it "assigns all account_sub_groups as @account_sub_groups" do
      AccountSubGroup.stub!(:find).with(:all).and_return([mock_account_sub_group])
      get :index
      assigns[:account_sub_groups].should == [mock_account_sub_group]
    end
  end

  describe "GET show" do
    it "assigns the requested account_sub_group as @account_sub_group" do
      AccountSubGroup.stub!(:find).with("37").and_return(mock_account_sub_group)
      get :show, :id => "37"
      assigns[:account_sub_group].should equal(mock_account_sub_group)
    end
  end

  describe "GET new" do
    it "assigns a new account_sub_group as @account_sub_group" do
      AccountSubGroup.stub!(:new).and_return(mock_account_sub_group)
      get :new
      assigns[:account_sub_group].should equal(mock_account_sub_group)
    end
  end

  describe "GET edit" do
    it "assigns the requested account_sub_group as @account_sub_group" do
      AccountSubGroup.stub!(:find).with("37").and_return(mock_account_sub_group)
      get :edit, :id => "37"
      assigns[:account_sub_group].should equal(mock_account_sub_group)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created account_sub_group as @account_sub_group" do
        AccountSubGroup.stub!(:new).with({'these' => 'params'}).and_return(mock_account_sub_group(:save => true))
        post :create, :account_sub_group => {:these => 'params'}
        assigns[:account_sub_group].should equal(mock_account_sub_group)
      end

      it "redirects to the created account_sub_group" do
        AccountSubGroup.stub!(:new).and_return(mock_account_sub_group(:save => true))
        post :create, :account_sub_group => {}
        response.should redirect_to(account_sub_group_url(mock_account_sub_group))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved account_sub_group as @account_sub_group" do
        AccountSubGroup.stub!(:new).with({'these' => 'params'}).and_return(mock_account_sub_group(:save => false))
        post :create, :account_sub_group => {:these => 'params'}
        assigns[:account_sub_group].should equal(mock_account_sub_group)
      end

      it "re-renders the 'new' template" do
        AccountSubGroup.stub!(:new).and_return(mock_account_sub_group(:save => false))
        post :create, :account_sub_group => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested account_sub_group" do
        AccountSubGroup.should_receive(:find).with("37").and_return(mock_account_sub_group)
        mock_account_sub_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :account_sub_group => {:these => 'params'}
      end

      it "assigns the requested account_sub_group as @account_sub_group" do
        AccountSubGroup.stub!(:find).and_return(mock_account_sub_group(:update_attributes => true))
        put :update, :id => "1", :account_sub_group => {:these => 'params'}
        assigns[:account_sub_group].should equal(mock_account_sub_group)
      end

      it "redirects to the account_sub_group" do
        AccountSubGroup.stub!(:find).and_return(mock_account_sub_group(:update_attributes => true))
        put :update, :id => "1", :account_sub_group => {:these => 'params'}
        response.should redirect_to(account_sub_group_url(mock_account_sub_group))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested account_sub_group" do
        AccountSubGroup.should_receive(:find).with("37").and_return(mock_account_sub_group)
        mock_account_sub_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :account_sub_group => {:these => 'params'}
      end

      it "assigns the account_sub_group as @account_sub_group" do
        AccountSubGroup.stub!(:find).and_return(mock_account_sub_group(:update_attributes => false))
        put :update, :id => "1", :account_sub_group => {:these => 'params'}
        assigns[:account_sub_group].should equal(mock_account_sub_group)
      end

      it "re-renders the 'edit' template" do
        AccountSubGroup.stub!(:find).and_return(mock_account_sub_group(:update_attributes => false))
        put :update, :id => "1", :account_sub_group => {:these => 'params'}
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested account_sub_group" do
      AccountSubGroup.should_receive(:find).with("37").and_return(mock_account_sub_group)
      mock_account_sub_group.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the account_sub_groups list" do
      AccountSubGroup.stub!(:find).and_return(mock_account_sub_group(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(account_sub_groups_url)
    end
  end

end
