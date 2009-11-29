class ChangeMaterialClass < ActiveRecord::Migration
  def self.up
    rename_column :materials, :class, :m_class
  end

  def self.down
    rename_column :materials, :m_class, :class
  end
end
