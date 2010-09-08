require File.join(Rails.root, "lib", "yahoo_integrator.rb")

class Quote < ActiveRecord::Base

  belongs_to :stock

  def to_s
    ""
  end


  def self.gather_quotes(stocks)
    yi = YahooIntegrator.new(@quotes)
    yi.run
  end
  
end
