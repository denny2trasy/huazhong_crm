class AddStatusToProduct < ActiveRecord::Migration
  def self.up
    add_column  :products, :status,  :integer
  end

  def self.down
    remove_column :products, :status
  end
end
