class Receiver < User
  has_many  :delivery_vouchers,  :foreign_key => "receiver_id"
end
