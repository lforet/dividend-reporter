require 'spec_helper'

describe "stocks/index.html.haml" do
  before(:each) do
    assign(:stocks, [
      stub_model(Stock,
        :name => "Name",
        :ticker => "Ticker"
      ),
      stub_model(Stock,
        :name => "Name",
        :ticker => "Ticker"
      )
    ])
  end

  it "renders a list of stocks" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Ticker".to_s, :count => 2)
  end
end
