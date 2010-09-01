require 'spec_helper'

describe "stocks/edit.html.haml" do
  before(:each) do
    @stock = assign(:stock, stub_model(Stock,
      :new_record? => false,
      :name => "MyString",
      :ticker => "MyString"
    ))
  end

  it "renders the edit stock form" do
    render

    rendered.should have_selector("form", :action => stock_path(@stock), :method => "post") do |form|
      form.should have_selector("input#stock_name", :name => "stock[name]")
      form.should have_selector("input#stock_ticker", :name => "stock[ticker]")
    end
  end
end
