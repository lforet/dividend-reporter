require "spec_helper"

describe QuotesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/quotes" }.should route_to(:controller => "quotes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/quotes/new" }.should route_to(:controller => "quotes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/quotes/1" }.should route_to(:controller => "quotes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/quotes/1/edit" }.should route_to(:controller => "quotes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/quotes" }.should route_to(:controller => "quotes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/quotes/1" }.should route_to(:controller => "quotes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/quotes/1" }.should route_to(:controller => "quotes", :action => "destroy", :id => "1")
    end

  end
end
