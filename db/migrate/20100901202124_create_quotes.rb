class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.integer :stock_id
      t.float :dividend
      t.date :exdate
      t.float :dividend_per_share
      t.float :last_price

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
