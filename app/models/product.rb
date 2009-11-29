class Product < ActiveRecord::Base
  belongs_to  :user
  has_many  :delivery_vouchers, :as => :owner
  has_many  :work_sheets
  belongs_to  :register
  has_many  :payments
  
  named_scope :no_finished, :conditions => "status = 1",  :order =>"started_at desc"
  
  def self.out_put_list
    returning [] do |list|
      Product.no_finished.each do |p|
        list << [p.name,p.id]
      end
      list.insert(0,[nil,nil])
    end
  end
end
