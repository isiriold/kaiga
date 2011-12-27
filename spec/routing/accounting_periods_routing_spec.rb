require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountingPeriodsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "accounting_periods", :action => "index").should == "/accounting_periods"
    end
  
    it "maps #new" do
      route_for(:controller => "accounting_periods", :action => "new").should == "/accounting_periods/new"
    end
  
    it "maps #show" do
      route_for(:controller => "accounting_periods", :action => "show", :id => "1").should == "/accounting_periods/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "accounting_periods", :action => "edit", :id => "1").should == "/accounting_periods/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "accounting_periods", :action => "create").should == {:path => "/accounting_periods", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "accounting_periods", :action => "update", :id => "1").should == {:path =>"/accounting_periods/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "accounting_periods", :action => "destroy", :id => "1").should == {:path =>"/accounting_periods/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/accounting_periods").should == {:controller => "accounting_periods", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/accounting_periods/new").should == {:controller => "accounting_periods", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/accounting_periods").should == {:controller => "accounting_periods", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/accounting_periods/1").should == {:controller => "accounting_periods", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/accounting_periods/1/edit").should == {:controller => "accounting_periods", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/accounting_periods/1").should == {:controller => "accounting_periods", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/accounting_periods/1").should == {:controller => "accounting_periods", :action => "destroy", :id => "1"}
    end
  end
end
