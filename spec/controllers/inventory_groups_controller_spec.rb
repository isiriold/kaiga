require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InventoryGroupsController do

  def mock_inventory_group(stubs={})
    @mock_inventory_group ||= mock_model(InventoryGroup, stubs)
  end
  
  describe "GET index" do
    it "assigns all inventory_groups as @inventory_groups" do
      InventoryGroup.stub!(:find).with(:all).and_return([mock_inventory_group])
      get :index
      assigns[:inventory_groups].should == [mock_inventory_group]
    end
  end

  describe "GET show" do
    it "assigns the requested inventory_group as @inventory_group" do
      InventoryGroup.stub!(:find).with("37").and_return(mock_inventory_group)
      get :show, :id => "37"
      assigns[:inventory_group].should equal(mock_inventory_group)
    end
  end

  describe "GET new" do
    it "assigns a new inventory_group as @inventory_group" do
      InventoryGroup.stub!(:new).and_return(mock_inventory_group)
      get :new
      assigns[:inventory_group].should equal(mock_inventory_group)
    end
  end

  describe "GET edit" do
    it "assigns the requested inventory_group as @inventory_group" do
      InventoryGroup.stub!(:find).with("37").and_return(mock_inventory_group)
      get :edit, :id => "37"
      assigns[:inventory_group].should equal(mock_inventory_group)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created inventory_group as @inventory_group" do
        InventoryGroup.stub!(:new).with({'these' => 'params'}).and_return(mock_inventory_group(:save => true))
        post :create, :inventory_group => {:these => 'params'}
        assigns[:inventory_group].should equal(mock_inventory_group)
      end

      it "redirects to the created inventory_group" do
        InventoryGroup.stub!(:new).and_return(mock_inventory_group(:save => true))
        post :create, :inventory_group => {}
        response.should redirect_to(inventory_group_url(mock_inventory_group))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved inventory_group as @inventory_group" do
        InventoryGroup.stub!(:new).with({'these' => 'params'}).and_return(mock_inventory_group(:save => false))
        post :create, :inventory_group => {:these => 'params'}
        assigns[:inventory_group].should equal(mock_inventory_group)
      end

      it "re-renders the 'new' template" do
        InventoryGroup.stub!(:new).and_return(mock_inventory_group(:save => false))
        post :create, :inventory_group => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested inventory_group" do
        InventoryGroup.should_receive(:find).with("37").and_return(mock_inventory_group)
        mock_inventory_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inventory_group => {:these => 'params'}
      end

      it "assigns the requested inventory_group as @inventory_group" do
        InventoryGroup.stub!(:find).and_return(mock_inventory_group(:update_attributes => true))
        put :update, :id => "1"
        assigns[:inventory_group].should equal(mock_inventory_group)
      end

      it "redirects to the inventory_group" do
        InventoryGroup.stub!(:find).and_return(mock_inventory_group(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(inventory_group_url(mock_inventory_group))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested inventory_group" do
        InventoryGroup.should_receive(:find).with("37").and_return(mock_inventory_group)
        mock_inventory_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inventory_group => {:these => 'params'}
      end

      it "assigns the inventory_group as @inventory_group" do
        InventoryGroup.stub!(:find).and_return(mock_inventory_group(:update_attributes => false))
        put :update, :id => "1"
        assigns[:inventory_group].should equal(mock_inventory_group)
      end

      it "re-renders the 'edit' template" do
        InventoryGroup.stub!(:find).and_return(mock_inventory_group(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested inventory_group" do
      InventoryGroup.should_receive(:find).with("37").and_return(mock_inventory_group)
      mock_inventory_group.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the inventory_groups list" do
      InventoryGroup.stub!(:find).and_return(mock_inventory_group(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(inventory_groups_url)
    end
  end

end
