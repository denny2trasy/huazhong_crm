class Admin::ListTypesController < ApplicationController
  in_place_edit_for :list_type, :name
  in_place_edit_for :list_type, :value
  def index
    @list_types = ListType.all
  end
  
  def new
   render :layout => false
  end
  
  def create 
    flash[:notice] = ListType.create(params[:list_type]) ? "Successful" : "Fail"
    redirect_to admin_list_types_path
  end
  
  def destroy
    flash[:notice] = ListType.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_list_types_path
  end
end
