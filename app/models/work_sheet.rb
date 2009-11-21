class WorkSheet < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :product
  belongs_to  :workshop
  belongs_to  :equipment
end
