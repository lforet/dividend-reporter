require "spec_helper"

describe StocksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/stocks" }.should route_to(:controller => "stocks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/stocks/new" }.should route_to(:controller => "stocks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/stocks/1" }.should route_to(:controller => "stocks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/stocks/1/edit" }.should route_to(:controller => "stocks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/stocks" }.should route_to(:controller => "stocks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/stocks/1" }.should route_to(:controller => "stocks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/stocks/1" }.should route_to(:controller => "stocks", :action => "destroy", :id => "1")
    end

  end
end
