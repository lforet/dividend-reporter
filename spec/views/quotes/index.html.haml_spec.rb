require 'spec_helper'

describe "quotes/index.html.haml" do
  before(:each) do
    assign(:quotes, [
      stub_model(Quote,
        :stock_id => 1,
        :dividend => 1.5,
        :dividend_per_share => 1.5,
        :last_price => 1.5
      ),
      stub_model(Quote,
        :stock_id => 1,
        :dividend => 1.5,
        :dividend_per_share => 1.5,
        :last_price => 1.5
      )
    ])
  end

  it "renders a list of quotes" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.5.to_s, :count => 2)
  end
end
