class Stock < ActiveRecord::Base

  has_many :quotes

  def to_s
    "#{ticker} - #{name}"
  end

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

end
