require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountTransactionsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "account_transactions", :action => "index").should == "/account_transactions"
    end
  
    it "maps #new" do
      route_for(:controller => "account_transactions", :action => "new").should == "/account_transactions/new"
    end
  
    it "maps #show" do
      route_for(:controller => "account_transactions", :action => "show", :id => "1").should == "/account_transactions/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "account_transactions", :action => "edit", :id => "1").should == "/account_transactions/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "account_transactions", :action => "create").should == {:path => "/account_transactions", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "account_transactions", :action => "update", :id => "1").should == {:path =>"/account_transactions/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "account_transactions", :action => "destroy", :id => "1").should == {:path =>"/account_transactions/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/account_transactions").should == {:controller => "account_transactions", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/account_transactions/new").should == {:controller => "account_transactions", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/account_transactions").should == {:controller => "account_transactions", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/account_transactions/1").should == {:controller => "account_transactions", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/account_transactions/1/edit").should == {:controller => "account_transactions", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/account_transactions/1").should == {:controller => "account_transactions", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/account_transactions/1").should == {:controller => "account_transactions", :action => "destroy", :id => "1"}
    end
  end
end
