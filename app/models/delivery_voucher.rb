class DeliveryVoucher < ActiveRecord::Base
  belongs_to  :material
  belongs_to  :brand
  belongs_to  :user
  belongs_to  :owner , :polymorphic => true
  belongs_to  :receiver
end
