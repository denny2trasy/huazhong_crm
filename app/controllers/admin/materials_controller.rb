class Admin::MaterialsController < ApplicationController
  in_place_edit_for :material, :name
  in_place_edit_for :material, :m_type
  in_place_edit_for :material, :m_class
  in_place_edit_for :material, :sub_class
  def index
    @materials = Material.all
  end
  
  def new
   render :layout => false
  end
  
  def create 
    flash[:notice] = Material.create(params[:material]) ? "Successful" : "Fail"
    redirect_to admin_materials_path
  end
  
  def destroy
    flash[:notice] = Material.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_materials_path
  end  
end
