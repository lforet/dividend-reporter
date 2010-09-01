require 'spec_helper'

describe "stocks/new.html.haml" do
  before(:each) do
    assign(:stock, stub_model(Stock,
      :new_record? => true,
      :name => "MyString",
      :ticker => "MyString"
    ))
  end

  it "renders new stock form" do
    render

    rendered.should have_selector("form", :action => stocks_path, :method => "post") do |form|
      form.should have_selector("input#stock_name", :name => "stock[name]")
      form.should have_selector("input#stock_ticker", :name => "stock[ticker]")
    end
  end
end
