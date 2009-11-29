class ListItem < ActiveRecord::Base
  belongs_to  :list_type
  
  def self.select_list_of(type)
    list = []
    t = ListType.find_by_value(type)
    list << [nil,nil]
    t.list_items.map {|item| list << [item.name,item.value]}
    return list
  end
  
  def self.inplace_select_list_of(type)
    list = []
    t = ListType.find_by_value(type)
    list << [nil,nil]
    t.list_items.map {|item| list << [item.id,item.name]}
    return list
  end

  def self.name_by_type_and_value(type,value)
    t = ListType.find_by_value(type)
    item = t.list_items.find_by_value(value.to_s)
    return (item.blank? ? "-" : item.name)
  end
  
end
