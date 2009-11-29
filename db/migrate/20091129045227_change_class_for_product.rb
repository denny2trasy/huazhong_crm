class ChangeClassForProduct < ActiveRecord::Migration
  def self.up
    rename_column :products,  :class, :p_class
  end

  def self.down
    rename_column :products,  :p_class, :class
  end
end
