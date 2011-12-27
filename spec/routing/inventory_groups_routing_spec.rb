require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InventoryGroupsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "inventory_groups", :action => "index").should == "/inventory_groups"
    end
  
    it "maps #new" do
      route_for(:controller => "inventory_groups", :action => "new").should == "/inventory_groups/new"
    end
  
    it "maps #show" do
      route_for(:controller => "inventory_groups", :action => "show", :id => "1").should == "/inventory_groups/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "inventory_groups", :action => "edit", :id => "1").should == "/inventory_groups/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "inventory_groups", :action => "create").should == {:path => "/inventory_groups", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "inventory_groups", :action => "update", :id => "1").should == {:path =>"/inventory_groups/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "inventory_groups", :action => "destroy", :id => "1").should == {:path =>"/inventory_groups/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/inventory_groups").should == {:controller => "inventory_groups", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/inventory_groups/new").should == {:controller => "inventory_groups", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/inventory_groups").should == {:controller => "inventory_groups", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/inventory_groups/1").should == {:controller => "inventory_groups", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/inventory_groups/1/edit").should == {:controller => "inventory_groups", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/inventory_groups/1").should == {:controller => "inventory_groups", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/inventory_groups/1").should == {:controller => "inventory_groups", :action => "destroy", :id => "1"}
    end
  end
end
