class Admin::BrandsController < ApplicationController
  
  def index
    @brands = Brand.all
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
