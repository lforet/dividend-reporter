require 'spec_helper'

describe "quotes/show.html.haml" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :stock_id => 1,
      :dividend => 1.5,
      :dividend_per_share => 1.5,
      :last_price => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.5.to_s)
    rendered.should contain(1.5.to_s)
    rendered.should contain(1.5.to_s)
  end
end
