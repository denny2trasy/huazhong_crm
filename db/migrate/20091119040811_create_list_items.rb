class CreateListItems < ActiveRecord::Migration
  def self.up
    create_table :list_items do |t|
      t.column  :class, :string
      t.column  :name,  :string
      t.column  :value, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :list_items
  end
end
