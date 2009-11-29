class Admin::BrandsController < ApplicationController
  in_place_edit_for   :brand, :name
  in_place_edit_for   :brand, :style
  in_place_edit_for   :brand, :capacity
  in_place_edit_for   :brand, :desc
  def index
    @brands = Brand.all
  end
  
  def new
    render  :layout => false
  end
  
  def create
    flash[:notice] = Brand.create(params[:brand]) ? "Successful" : "Fail"
    redirect_to admin_brands_path
  end
  
  def destroy
    flash[:notice] = Brand.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_brands_path
  end
  
end
