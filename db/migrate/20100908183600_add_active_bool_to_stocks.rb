class AddActiveBoolToStocks < ActiveRecord::Migration
  def self.up
    add_column :stocks, :active, :boolean, :default => 1
  end

  def self.down
    remove_column :stocks, :active
  end
end
