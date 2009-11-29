class ChangeCapacityType < ActiveRecord::Migration
  def self.up
    change_column :brands, :capacity,  :string
  end

  def self.down
    change_column :brands, :capacity,  :integer
  end
end
