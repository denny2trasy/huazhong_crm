class Product < ActiveRecord::Base
  belongs_to  :user
  has_many  :delivery_vouchers, :as => :owner
  has_many  :work_sheets
end