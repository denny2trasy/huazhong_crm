class Register < User
  has_many  :products,  :foreign_key => "register_id"
end
