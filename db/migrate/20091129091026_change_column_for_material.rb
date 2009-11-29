class ChangeColumnForMaterial < ActiveRecord::Migration
  def self.up
    change_column  :materials, :diameter,  :integer
  end

  def self.down
    change_column  :materials, :diameter,  :float
  end
end
