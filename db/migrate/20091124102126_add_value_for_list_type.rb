class AddValueForListType < ActiveRecord::Migration
  def self.up
    add_column  :list_types,  :value, :string
  end

  def self.down
    remove_column :list_types,  :value
  end
end
