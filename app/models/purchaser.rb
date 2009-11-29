class Purchaser < User
  has_many  :warehouse_vouchers,  :foreign_key => "purchaser_id"
end
