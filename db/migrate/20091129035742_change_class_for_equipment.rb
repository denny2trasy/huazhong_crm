class ChangeClassForEquipment < ActiveRecord::Migration
  def self.up
    rename_column :equipment, :class, :e_class
  end

  def self.down
    rename_column :equipment, :e_class, :class
  end
end
