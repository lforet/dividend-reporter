require File.join(Rails.root, "lib", "yahoo_integrator.rb")

class Quote < ActiveRecord::Base

  validates_presence_of :stock_id, :dividend, :exdate, :dividend_per_share, :last_price

  belongs_to :stock

  def to_s
    ""
  end


  def self.gather_quotes(stocks)
    tickers = stocks.map{|x| x.ticker}
    yi = YahooIntegrator.new(tickers)
    yi.run
  end
  
end
