class Admin::InputBillsController < ApplicationController
  in_place_edit_for   :warehouse_voucher, :amount
  in_place_edit_for   :warehouse_voucher, :unit_price
  def index
    @warehouse_vouchers = WarehouseVoucher.all(:order=>"created_at desc")
  end
  
  def new
    render :layout => false
  end
  
  def create
    material = Material.find_or_create_by(params[:material])
    brand = Brand.find_or_create_by(params[:brand])
    flash[:notice] = current_user.warehouse_vouchers.create(params[:warehouse_voucher].merge({:material_id=>material.id,:brand_id=>brand.id})) ? "Successful" : "Fail"
    redirect_to admin_input_bills_path
  end
  
  def destroy
    flash[:notice] = WarehouseVoucher.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_input_bills_path    
  end
  
end
