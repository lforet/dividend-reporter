require 'spec_helper'

describe "quotes/edit.html.haml" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :new_record? => false,
      :stock_id => 1,
      :dividend => 1.5,
      :dividend_per_share => 1.5,
      :last_price => 1.5
    ))
  end

  it "renders the edit quote form" do
    render

    rendered.should have_selector("form", :action => quote_path(@quote), :method => "post") do |form|
      form.should have_selector("input#quote_stock_id", :name => "quote[stock_id]")
      form.should have_selector("input#quote_dividend", :name => "quote[dividend]")
      form.should have_selector("input#quote_dividend_per_share", :name => "quote[dividend_per_share]")
      form.should have_selector("input#quote_last_price", :name => "quote[last_price]")
    end
  end
end
