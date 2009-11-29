class Admin::OutputBillsController < ApplicationController
  in_place_edit_for   :delivery_voucher, :amount

  def index
    @delivery_vouchers = DeliveryVoucher.all(:order=>"created_at desc")
  end
  
  def new
    @owner_type = params[:owner_type]
    @owner_list = (@owner_type == "Product" ? Product.out_put_list : Workshop.select_list)
    render :layout => false
  end
  
  def create
    material = Material.find_or_create_by(params[:material])
    brand = Brand.find_or_create_by(params[:brand])
    flash[:notice] = current_user.delivery_vouchers.create(params[:delivery_voucher].merge({:material_id=>material.id,:brand_id=>brand.id})) ? "Successful" : "Fail"
    redirect_to admin_output_bills_path
  end
  
  def destroy
    flash[:notice] = DeliveryVoucher.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_output_bills_path    
  end  
end
