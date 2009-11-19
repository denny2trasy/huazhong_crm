class CreateDeliveryVouchers < ActiveRecord::Migration
  def self.up
    create_table :delivery_vouchers do |t|
      t.column  :material_id, :integer
      t.column  :brand_id,  :integer
      t.column  :user_id,  :integer
      t.column  :receiver_id,   :integer
      t.column  :amount,  :integer
      t.column  :owner_id,  :integer    #如果是耗材就是车间ID，如果是配件就是产品ID
      t.column  :owner_type,  :string   #使用者 车间 产品
      t.column  :desc,  :text
      t.timestamps
    end
  end

  def self.down
    drop_table :delivery_vouchers
  end
end
