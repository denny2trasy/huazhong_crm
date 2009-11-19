class Workshop < ActiveRecord::Base
  belongs_to  :user
  has_many  :equipments
  has_many  :delivery_vouchers, :as => :owner  
end
