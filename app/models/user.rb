class User < ActiveRecord::Base
  has_many  :products
  has_many  :warehouse_vouchers
  has_many  :delivery_vouchers
  has_many  :work_sheets
  has_one  :workshops
  has_one  :equipments
end
