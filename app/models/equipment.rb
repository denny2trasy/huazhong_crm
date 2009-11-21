class Equipment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :workshop
  has_many  :work_sheets
end
