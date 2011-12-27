require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InventoryUnitOfMeasurementsController do

  def mock_inventory_unit_of_measurements(stubs={})
    @mock_inventory_unit_of_measurements ||= mock_model(InventoryUnitOfMeasurements, stubs)
  end
  
  describe "GET index" do
    it "assigns all inventory_unit_of_measurements as @inventory_unit_of_measurements" do
      InventoryUnitOfMeasurements.stub!(:find).with(:all).and_return([mock_inventory_unit_of_measurements])
      get :index
      assigns[:inventory_unit_of_measurements].should == [mock_inventory_unit_of_measurements]
    end
  end

  describe "GET show" do
    it "assigns the requested inventory_unit_of_measurements as @inventory_unit_of_measurements" do
      InventoryUnitOfMeasurements.stub!(:find).with("37").and_return(mock_inventory_unit_of_measurements)
      get :show, :id => "37"
      assigns[:inventory_unit_of_measurements].should equal(mock_inventory_unit_of_measurements)
    end
  end

  describe "GET new" do
    it "assigns a new inventory_unit_of_measurements as @inventory_unit_of_measurements" do
      InventoryUnitOfMeasurements.stub!(:new).and_return(mock_inventory_unit_of_measurements)
      get :new
      assigns[:inventory_unit_of_measurements].should equal(mock_inventory_unit_of_measurements)
    end
  end

  describe "GET edit" do
    it "assigns the requested inventory_unit_of_measurements as @inventory_unit_of_measurements" do
      InventoryUnitOfMeasurements.stub!(:find).with("37").and_return(mock_inventory_unit_of_measurements)
      get :edit, :id => "37"
      assigns[:inventory_unit_of_measurements].should equal(mock_inventory_unit_of_measurements)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created inventory_unit_of_measurements as @inventory_unit_of_measurements" do
        InventoryUnitOfMeasurements.stub!(:new).with({'these' => 'params'}).and_return(mock_inventory_unit_of_measurements(:save => true))
        post :create, :inventory_unit_of_measurements => {:these => 'params'}
        assigns[:inventory_unit_of_measurements].should equal(mock_inventory_unit_of_measurements)
      end

      it "redirects to the created inventory_unit_of_measurements" do
        InventoryUnitOfMeasurements.stub!(:new).and_return(mock_inventory_unit_of_measurements(:save => true))
        post :create, :inventory_unit_of_measurements => {}
        response.should redirect_to(inventory_unit_of_measurement_url(mock_inventory_unit_of_measurements))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved inventory_unit_of_measurements as @inventory_unit_of_measurements" do
        InventoryUnitOfMeasurements.stub!(:new).with({'these' => 'params'}).and_return(mock_inventory_unit_of_measurements(:save => false))
        post :create, :inventory_unit_of_measurements => {:these => 'params'}
        assigns[:inventory_unit_of_measurements].should equal(mock_inventory_unit_of_measurements)
      end

      it "re-renders the 'new' template" do
        InventoryUnitOfMeasurements.stub!(:new).and_return(mock_inventory_unit_of_measurements(:save => false))
        post :create, :inventory_unit_of_measurements => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested inventory_unit_of_measurements" do
        InventoryUnitOfMeasurements.should_receive(:find).with("37").and_return(mock_inventory_unit_of_measurements)
        mock_inventory_unit_of_measurements.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inventory_unit_of_measurements => {:these => 'params'}
      end

      it "assigns the requested inventory_unit_of_measurements as @inventory_unit_of_measurements" do
        InventoryUnitOfMeasurements.stub!(:find).and_return(mock_inventory_unit_of_measurements(:update_attributes => true))
        put :update, :id => "1"
        assigns[:inventory_unit_of_measurements].should equal(mock_inventory_unit_of_measurements)
      end

      it "redirects to the inventory_unit_of_measurements" do
        InventoryUnitOfMeasurements.stub!(:find).and_return(mock_inventory_unit_of_measurements(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(inventory_unit_of_measurement_url(mock_inventory_unit_of_measurements))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested inventory_unit_of_measurements" do
        InventoryUnitOfMeasurements.should_receive(:find).with("37").and_return(mock_inventory_unit_of_measurements)
        mock_inventory_unit_of_measurements.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inventory_unit_of_measurements => {:these => 'params'}
      end

      it "assigns the inventory_unit_of_measurements as @inventory_unit_of_measurements" do
        InventoryUnitOfMeasurements.stub!(:find).and_return(mock_inventory_unit_of_measurements(:update_attributes => false))
        put :update, :id => "1"
        assigns[:inventory_unit_of_measurements].should equal(mock_inventory_unit_of_measurements)
      end

      it "re-renders the 'edit' template" do
        InventoryUnitOfMeasurements.stub!(:find).and_return(mock_inventory_unit_of_measurements(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested inventory_unit_of_measurements" do
      InventoryUnitOfMeasurements.should_receive(:find).with("37").and_return(mock_inventory_unit_of_measurements)
      mock_inventory_unit_of_measurements.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the inventory_unit_of_measurements list" do
      InventoryUnitOfMeasurements.stub!(:find).and_return(mock_inventory_unit_of_measurements(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(inventory_unit_of_measurements_url)
    end
  end

end
