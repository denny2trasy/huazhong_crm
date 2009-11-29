class Workshop < ActiveRecord::Base
  belongs_to  :user
  has_many  :equipments
  has_many  :delivery_vouchers, :as => :owner
  has_many  :work_sheets
  
  def self.select_list
    returning [] do |list|
      Workshop.all.each do |ws|
        list << [ws.name,ws.id]
      end
      list.insert(0,[nil,nil])
    end
  end
end
