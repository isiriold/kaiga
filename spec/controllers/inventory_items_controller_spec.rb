require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InventoryItemsController do

  def mock_inventory_item(stubs={})
    @mock_inventory_item ||= mock_model(InventoryItem, stubs)
  end
  
  describe "GET index" do
    it "assigns all inventory_items as @inventory_items" do
      InventoryItem.stub!(:find).with(:all).and_return([mock_inventory_item])
      get :index
      assigns[:inventory_items].should == [mock_inventory_item]
    end
  end

  describe "GET show" do
    it "assigns the requested inventory_item as @inventory_item" do
      InventoryItem.stub!(:find).with("37").and_return(mock_inventory_item)
      get :show, :id => "37"
      assigns[:inventory_item].should equal(mock_inventory_item)
    end
  end

  describe "GET new" do
    it "assigns a new inventory_item as @inventory_item" do
      InventoryItem.stub!(:new).and_return(mock_inventory_item)
      get :new
      assigns[:inventory_item].should equal(mock_inventory_item)
    end
  end

  describe "GET edit" do
    it "assigns the requested inventory_item as @inventory_item" do
      InventoryItem.stub!(:find).with("37").and_return(mock_inventory_item)
      get :edit, :id => "37"
      assigns[:inventory_item].should equal(mock_inventory_item)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created inventory_item as @inventory_item" do
        InventoryItem.stub!(:new).with({'these' => 'params'}).and_return(mock_inventory_item(:save => true))
        post :create, :inventory_item => {:these => 'params'}
        assigns[:inventory_item].should equal(mock_inventory_item)
      end

      it "redirects to the created inventory_item" do
        InventoryItem.stub!(:new).and_return(mock_inventory_item(:save => true))
        post :create, :inventory_item => {}
        response.should redirect_to(inventory_item_url(mock_inventory_item))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved inventory_item as @inventory_item" do
        InventoryItem.stub!(:new).with({'these' => 'params'}).and_return(mock_inventory_item(:save => false))
        post :create, :inventory_item => {:these => 'params'}
        assigns[:inventory_item].should equal(mock_inventory_item)
      end

      it "re-renders the 'new' template" do
        InventoryItem.stub!(:new).and_return(mock_inventory_item(:save => false))
        post :create, :inventory_item => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested inventory_item" do
        InventoryItem.should_receive(:find).with("37").and_return(mock_inventory_item)
        mock_inventory_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inventory_item => {:these => 'params'}
      end

      it "assigns the requested inventory_item as @inventory_item" do
        InventoryItem.stub!(:find).and_return(mock_inventory_item(:update_attributes => true))
        put :update, :id => "1"
        assigns[:inventory_item].should equal(mock_inventory_item)
      end

      it "redirects to the inventory_item" do
        InventoryItem.stub!(:find).and_return(mock_inventory_item(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(inventory_item_url(mock_inventory_item))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested inventory_item" do
        InventoryItem.should_receive(:find).with("37").and_return(mock_inventory_item)
        mock_inventory_item.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inventory_item => {:these => 'params'}
      end

      it "assigns the inventory_item as @inventory_item" do
        InventoryItem.stub!(:find).and_return(mock_inventory_item(:update_attributes => false))
        put :update, :id => "1"
        assigns[:inventory_item].should equal(mock_inventory_item)
      end

      it "re-renders the 'edit' template" do
        InventoryItem.stub!(:find).and_return(mock_inventory_item(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested inventory_item" do
      InventoryItem.should_receive(:find).with("37").and_return(mock_inventory_item)
      mock_inventory_item.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the inventory_items list" do
      InventoryItem.stub!(:find).and_return(mock_inventory_item(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(inventory_items_url)
    end
  end

end
