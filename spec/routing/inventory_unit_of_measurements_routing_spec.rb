require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InventoryUnitOfMeasurementsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "inventory_unit_of_measurements", :action => "index").should == "/inventory_unit_of_measurements"
    end
  
    it "maps #new" do
      route_for(:controller => "inventory_unit_of_measurements", :action => "new").should == "/inventory_unit_of_measurements/new"
    end
  
    it "maps #show" do
      route_for(:controller => "inventory_unit_of_measurements", :action => "show", :id => "1").should == "/inventory_unit_of_measurements/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "inventory_unit_of_measurements", :action => "edit", :id => "1").should == "/inventory_unit_of_measurements/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "inventory_unit_of_measurements", :action => "create").should == {:path => "/inventory_unit_of_measurements", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "inventory_unit_of_measurements", :action => "update", :id => "1").should == {:path =>"/inventory_unit_of_measurements/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "inventory_unit_of_measurements", :action => "destroy", :id => "1").should == {:path =>"/inventory_unit_of_measurements/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/inventory_unit_of_measurements").should == {:controller => "inventory_unit_of_measurements", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/inventory_unit_of_measurements/new").should == {:controller => "inventory_unit_of_measurements", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/inventory_unit_of_measurements").should == {:controller => "inventory_unit_of_measurements", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/inventory_unit_of_measurements/1").should == {:controller => "inventory_unit_of_measurements", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/inventory_unit_of_measurements/1/edit").should == {:controller => "inventory_unit_of_measurements", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/inventory_unit_of_measurements/1").should == {:controller => "inventory_unit_of_measurements", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/inventory_unit_of_measurements/1").should == {:controller => "inventory_unit_of_measurements", :action => "destroy", :id => "1"}
    end
  end
end
