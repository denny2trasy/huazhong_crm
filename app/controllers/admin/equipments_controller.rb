class Admin::EquipmentsController < ApplicationController
  in_place_edit_for :equipment, :name
  in_place_edit_for :equipment, :buy_at
  in_place_edit_for :equipment, :from
  in_place_edit_for :equipment, :desc
  before_filter :get_workshop,  :except => [:set_equipment_name,:set_equipment_buy_at,:set_equipment_from,:set_equipment_desc]
  def index
    @equipments = @workshop.equipments
  end
  def new
    render :layout => false
  end
  
  def create
    buy_at = params[:temp].blank? ? Time.now : Date.new(params[:temp]["at(1i)"].to_i,params[:temp]["at(2i)"].to_i,params[:temp]["at(3i)"].to_i).to_time
    flash[:notice] = @workshop.equipments.create(params[:equipment].merge({:buy_at => buy_at})) ? "Successful" : "Fail"
    redirect_to admin_equipments_path(:workshop_id=>@workshop.id)
  end
  
  def destroy
    flash[:notice] = Equipment.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_equipments_path(:workshop_id=>@workshop.id)
  end
  
  private
  def get_workshop
    @workshop = Workshop.find_by_id(params[:workshop_id])
  end  
end
