class CreateWarehouseVouchers < ActiveRecord::Migration
  def self.up
    create_table :warehouse_vouchers do |t|
      t.column  :material_id, :integer
      t.column  :brand_id,  :integer
      t.column  :purchaser_id,  :integer
      t.column  :user_id,   :integer
      t.column  :amount,  :integer
      t.column  :unit_price,  :float
      t.column  :desc,  :text
      t.timestamps
    end
  end

  def self.down
    drop_table :warehouse_vouchers
  end
end
