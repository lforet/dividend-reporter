require 'spec_helper'

describe StocksController do

  def mock_stock(stubs={})
    @mock_stock ||= mock_model(Stock, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all stocks as @stocks" do
      Stock.stub(:all) { [mock_stock] }
      get :index
      assigns(:stocks).should eq([mock_stock])
    end
  end

  describe "GET show" do
    it "assigns the requested stock as @stock" do
      Stock.stub(:find).with("37") { mock_stock }
      get :show, :id => "37"
      assigns(:stock).should be(mock_stock)
    end
  end

  describe "GET new" do
    it "assigns a new stock as @stock" do
      Stock.stub(:new) { mock_stock }
      get :new
      assigns(:stock).should be(mock_stock)
    end
  end

  describe "GET edit" do
    it "assigns the requested stock as @stock" do
      Stock.stub(:find).with("37") { mock_stock }
      get :edit, :id => "37"
      assigns(:stock).should be(mock_stock)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created stock as @stock" do
        Stock.stub(:new).with({'these' => 'params'}) { mock_stock(:save => true) }
        post :create, :stock => {'these' => 'params'}
        assigns(:stock).should be(mock_stock)
      end

      it "redirects to the created stock" do
        Stock.stub(:new) { mock_stock(:save => true) }
        post :create, :stock => {}
        response.should redirect_to(stock_url(mock_stock))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved stock as @stock" do
        Stock.stub(:new).with({'these' => 'params'}) { mock_stock(:save => false) }
        post :create, :stock => {'these' => 'params'}
        assigns(:stock).should be(mock_stock)
      end

      it "re-renders the 'new' template" do
        Stock.stub(:new) { mock_stock(:save => false) }
        post :create, :stock => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested stock" do
        Stock.should_receive(:find).with("37") { mock_stock }
        mock_stock.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :stock => {'these' => 'params'}
      end

      it "assigns the requested stock as @stock" do
        Stock.stub(:find) { mock_stock(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:stock).should be(mock_stock)
      end

      it "redirects to the stock" do
        Stock.stub(:find) { mock_stock(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(stock_url(mock_stock))
      end
    end

    describe "with invalid params" do
      it "assigns the stock as @stock" do
        Stock.stub(:find) { mock_stock(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:stock).should be(mock_stock)
      end

      it "re-renders the 'edit' template" do
        Stock.stub(:find) { mock_stock(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested stock" do
      Stock.should_receive(:find).with("37") { mock_stock }
      mock_stock.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the stocks list" do
      Stock.stub(:find) { mock_stock }
      delete :destroy, :id => "1"
      response.should redirect_to(stocks_url)
    end
  end

end
