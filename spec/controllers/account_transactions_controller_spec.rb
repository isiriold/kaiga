require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountTransactionsController do

  def mock_account_transaction(stubs={})
    @mock_account_transaction ||= mock_model(AccountTransaction, stubs)
  end
  
  before(:each) do
    do_login
  end  
  
  describe "GET index" do
    it "assigns all account_transactions as @account_transactions" do
      AccountTransaction.stub!(:find).with(:all).and_return([mock_account_transaction])
      get :index
      assigns[:account_transactions].should == [mock_account_transaction]
    end
  end

  describe "GET show" do
    it "assigns the requested account_transaction as @account_transaction" do
      AccountTransaction.stub!(:find).with("37").and_return(mock_account_transaction)
      get :show, :id => "37"
      assigns[:account_transaction].should equal(mock_account_transaction)
    end
  end

  describe "GET new" do
    it "assigns a new account_transaction as @account_transaction" do
      AccountTransaction.stub!(:new).and_return(mock_account_transaction(:account_transaction_items => [mock_model(AccountTransactionItem)]))
      mock_account_transaction.should_receive(:account_transaction_items)
      get :new
      assigns[:account_transaction].should equal(mock_account_transaction)
    end
  end

  describe "GET edit" do
    it "assigns the requested account_transaction as @account_transaction" do
      AccountTransaction.stub!(:find).with("37").and_return(mock_account_transaction)
      get :edit, :id => "37"
      assigns[:account_transaction].should equal(mock_account_transaction)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created account_transaction as @account_transaction" do
        AccountTransaction.stub!(:new).with({'these' => 'params'}).and_return(mock_account_transaction(:save => true))
        post :create, :account_transaction => {:these => 'params'}
        assigns[:account_transaction].should equal(mock_account_transaction)
      end

      it "redirects to the created account_transaction" do
        AccountTransaction.stub!(:new).and_return(mock_account_transaction(:save => true))
        post :create, :account_transaction => {}
        response.should redirect_to(account_transaction_url(mock_account_transaction))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved account_transaction as @account_transaction" do
        AccountTransaction.stub!(:new).with({'these' => 'params'}).and_return(mock_account_transaction(:save => false))
        post :create, :account_transaction => {:these => 'params'}
        assigns[:account_transaction].should equal(mock_account_transaction)
      end

      it "re-renders the 'new' template" do
        AccountTransaction.stub!(:new).and_return(mock_account_transaction(:save => false))
        post :create, :account_transaction => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested account_transaction" do
        AccountTransaction.should_receive(:find).with("37").and_return(mock_account_transaction)
        mock_account_transaction.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :account_transaction => {:these => 'params'}
      end

      it "assigns the requested account_transaction as @account_transaction" do
        AccountTransaction.stub!(:find).and_return(mock_account_transaction(:update_attributes => true))
        put :update, :id => "1"
        assigns[:account_transaction].should equal(mock_account_transaction)
      end

      it "redirects to the account_transaction" do
        AccountTransaction.stub!(:find).and_return(mock_account_transaction(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(account_transaction_url(mock_account_transaction))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested account_transaction" do
        AccountTransaction.should_receive(:find).with("37").and_return(mock_account_transaction)
        mock_account_transaction.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :account_transaction => {:these => 'params'}
      end

      it "assigns the account_transaction as @account_transaction" do
        AccountTransaction.stub!(:find).and_return(mock_account_transaction(:update_attributes => false))
        put :update, :id => "1"
        assigns[:account_transaction].should equal(mock_account_transaction)
      end

      it "re-renders the 'edit' template" do
        AccountTransaction.stub!(:find).and_return(mock_account_transaction(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested account_transaction" do
      AccountTransaction.should_receive(:find).with("37").and_return(mock_account_transaction)
      mock_account_transaction.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the account_transactions list" do
      AccountTransaction.stub!(:find).and_return(mock_account_transaction(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(account_transactions_url)
    end
  end

end
