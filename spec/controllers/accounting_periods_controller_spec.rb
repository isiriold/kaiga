require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountingPeriodsController do

  def mock_accounting_period(stubs={})
    @mock_accounting_period ||= mock_model(AccountingPeriod, stubs)
  end

  before(:each) do
    do_login
  end
  
  describe "GET index" do
    it "assigns all accounting_periods as @accounting_periods" do
      AccountingPeriod.stub!(:find).with(:all).and_return([mock_accounting_period])
      get :index
      assigns[:accounting_periods].should == [mock_accounting_period]
    end
  end

  describe "GET show" do
    it "assigns the requested accounting_period as @accounting_period" do
      AccountingPeriod.stub!(:find).with("37").and_return(mock_accounting_period)
      get :show, :id => "37"
      assigns[:accounting_period].should equal(mock_accounting_period)
    end
  end

  describe "GET new" do
    it "assigns a new accounting_period as @accounting_period" do
      AccountingPeriod.stub!(:new).and_return(mock_accounting_period)
      get :new
      assigns[:accounting_period].should equal(mock_accounting_period)
    end
  end

  describe "GET edit" do
    it "assigns the requested accounting_period as @accounting_period" do
      AccountingPeriod.stub!(:find).with("37").and_return(mock_accounting_period)
      get :edit, :id => "37"
      assigns[:accounting_period].should equal(mock_accounting_period)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created accounting_period as @accounting_period" do
        AccountingPeriod.stub!(:new).with({'these' => 'params'}).and_return(mock_accounting_period(:save => true))
        post :create, :accounting_period => {:these => 'params'}
        assigns[:accounting_period].should equal(mock_accounting_period)
      end

      it "redirects to the created accounting_period" do
        AccountingPeriod.stub!(:new).and_return(mock_accounting_period(:save => true))
        post :create, :accounting_period => {}
        response.should redirect_to(accounting_period_url(mock_accounting_period))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved accounting_period as @accounting_period" do
        AccountingPeriod.stub!(:new).with({'these' => 'params'}).and_return(mock_accounting_period(:save => false))
        post :create, :accounting_period => {:these => 'params'}
        assigns[:accounting_period].should equal(mock_accounting_period)
      end

      it "re-renders the 'new' template" do
        AccountingPeriod.stub!(:new).and_return(mock_accounting_period(:save => false))
        post :create, :accounting_period => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested accounting_period" do
        AccountingPeriod.should_receive(:find).with("37").and_return(mock_accounting_period)
        mock_accounting_period.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :accounting_period => {:these => 'params'}
      end

      it "assigns the requested accounting_period as @accounting_period" do
        AccountingPeriod.stub!(:find).and_return(mock_accounting_period(:update_attributes => true))
        put :update, :id => "1"
        assigns[:accounting_period].should equal(mock_accounting_period)
      end

      it "redirects to the accounting_period" do
        AccountingPeriod.stub!(:find).and_return(mock_accounting_period(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(accounting_period_url(mock_accounting_period))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested accounting_period" do
        AccountingPeriod.should_receive(:find).with("37").and_return(mock_accounting_period)
        mock_accounting_period.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :accounting_period => {:these => 'params'}
      end

      it "assigns the accounting_period as @accounting_period" do
        AccountingPeriod.stub!(:find).and_return(mock_accounting_period(:update_attributes => false))
        put :update, :id => "1"
        assigns[:accounting_period].should equal(mock_accounting_period)
      end

      it "re-renders the 'edit' template" do
        AccountingPeriod.stub!(:find).and_return(mock_accounting_period(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested accounting_period" do
      AccountingPeriod.should_receive(:find).with("37").and_return(mock_accounting_period)
      mock_accounting_period.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the accounting_periods list" do
      AccountingPeriod.stub!(:find).and_return(mock_accounting_period(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(accounting_periods_url)
    end
  end

end
