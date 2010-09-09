class Stock < ActiveRecord::Base

  validates_presence_of :name, :ticker
  validates_uniqueness_of :name, :ticker

  has_many :quotes

  def to_s
    "#{ticker} - #{name}"
  end

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)

end
