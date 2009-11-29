class Material < ActiveRecord::Base
  has_many  :warehouse_vouchers
  has_many  :delivery_vouchers
  
  def self.find_or_create_by(params)
    return Material.find_or_create_by_m_type_and_m_class_and_sub_class_and_diameter(params[:m_type],params[:m_class],params[:sub_class],params[:diameter])
  end
  
  def show_name
    "#{ListItem.name_by_type_and_value("m_type",self.m_type)} - #{ListItem.name_by_type_and_value("m_class",self.m_class)} - #{ListItem.name_by_type_and_value("sub_class",self.sub_class)} - #{ListItem.name_by_type_and_value("diameter",self.diameter)}"
  end
end
