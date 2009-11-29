class ChangeColumnOfListItems < ActiveRecord::Migration
  def self.up
    change_column :list_items,  :class, :integer
    rename_column :list_items,  :class, :list_type_id
  end

  def self.down
    change_column :list_items,  :list_type_id, :string
    rename_column :list_items,  :list_type_id, :class 

  end
end
