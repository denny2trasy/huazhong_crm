class Brand < ActiveRecord::Base
  has_many  :warehouse_vouchers
  has_many  :delivery_vouchers
end
