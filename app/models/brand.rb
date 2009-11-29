class Brand < ActiveRecord::Base
  has_many  :warehouse_vouchers
  has_many  :delivery_vouchers
  
  def self.find_or_create_by(params)
    return Brand.find_or_create_by_name_and_style_and_capacity(params[:name],params[:style],params[:capacity])
  end

  def show_name
    "#{ListItem.name_by_type_and_value("brand_name",self.name)} - #{ListItem.name_by_type_and_value("brand_style",self.style)} - #{ListItem.name_by_type_and_value("capacity",self.capacity)}"
  end  
end
