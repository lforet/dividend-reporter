require 'spec_helper'

describe "stocks/show.html.haml" do
  before(:each) do
    @stock = assign(:stock, stub_model(Stock,
      :name => "Name",
      :ticker => "Ticker"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Ticker".to_s)
  end
end
