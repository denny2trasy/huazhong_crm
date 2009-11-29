class Admin::ListItemsController < ApplicationController
  in_place_edit_for :list_item, :name
  in_place_edit_for :list_item, :value
  before_filter :get_type,  :except => [:set_list_item_name,:set_list_item_value]
  def index
    @list_items = @type.list_items
  end
  def new
    render :layout => false
  end
  
  def create
    flash[:notice] = @type.list_items.create(params[:list_item]) ? "Successful" : "Fail"
    redirect_to admin_list_items_path(:type_id=>@type.id)
  end
  
  def destroy
    flash[:notice] = ListItem.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_list_items_path(:type_id=>@type.id)
  end
  
  private
  def get_type
    @type = ListType.find_by_id(params[:type_id])
  end
  
end
