class ChangeMaterialType < ActiveRecord::Migration
  def self.up
    rename_column :materials, :type,  :m_type
    change_column :materials, :m_type,  :integer
  end

  def self.down
    rename_column :materials, :m_type,  :type
    change_column :materials, :type,  :string    
  end
end
