require 'spec_helper'

describe QuotesController do

  def mock_quote(stubs={})
    @mock_quote ||= mock_model(Quote, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all quotes as @quotes" do
      Quote.stub(:all) { [mock_quote] }
      get :index
      assigns(:quotes).should eq([mock_quote])
    end
  end

  describe "GET show" do
    it "assigns the requested quote as @quote" do
      Quote.stub(:find).with("37") { mock_quote }
      get :show, :id => "37"
      assigns(:quote).should be(mock_quote)
    end
  end

  describe "GET new" do
    it "assigns a new quote as @quote" do
      Quote.stub(:new) { mock_quote }
      get :new
      assigns(:quote).should be(mock_quote)
    end
  end

  describe "GET edit" do
    it "assigns the requested quote as @quote" do
      Quote.stub(:find).with("37") { mock_quote }
      get :edit, :id => "37"
      assigns(:quote).should be(mock_quote)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created quote as @quote" do
        Quote.stub(:new).with({'these' => 'params'}) { mock_quote(:save => true) }
        post :create, :quote => {'these' => 'params'}
        assigns(:quote).should be(mock_quote)
      end

      it "redirects to the created quote" do
        Quote.stub(:new) { mock_quote(:save => true) }
        post :create, :quote => {}
        response.should redirect_to(quote_url(mock_quote))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved quote as @quote" do
        Quote.stub(:new).with({'these' => 'params'}) { mock_quote(:save => false) }
        post :create, :quote => {'these' => 'params'}
        assigns(:quote).should be(mock_quote)
      end

      it "re-renders the 'new' template" do
        Quote.stub(:new) { mock_quote(:save => false) }
        post :create, :quote => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested quote" do
        Quote.should_receive(:find).with("37") { mock_quote }
        mock_quote.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :quote => {'these' => 'params'}
      end

      it "assigns the requested quote as @quote" do
        Quote.stub(:find) { mock_quote(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:quote).should be(mock_quote)
      end

      it "redirects to the quote" do
        Quote.stub(:find) { mock_quote(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(quote_url(mock_quote))
      end
    end

    describe "with invalid params" do
      it "assigns the quote as @quote" do
        Quote.stub(:find) { mock_quote(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:quote).should be(mock_quote)
      end

      it "re-renders the 'edit' template" do
        Quote.stub(:find) { mock_quote(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested quote" do
      Quote.should_receive(:find).with("37") { mock_quote }
      mock_quote.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the quotes list" do
      Quote.stub(:find) { mock_quote }
      delete :destroy, :id => "1"
      response.should redirect_to(quotes_url)
    end
  end

end
