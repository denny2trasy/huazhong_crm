class WarehouseVoucher < ActiveRecord::Base
  belongs_to  :material
  belongs_to  :brand
  belongs_to  :user  
end
