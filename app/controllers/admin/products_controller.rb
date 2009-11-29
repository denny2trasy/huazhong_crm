class Admin::ProductsController < ApplicationController
  in_place_edit_for   :product, :name
  in_place_edit_for   :product, :customer_name
  in_place_edit_for   :product, :customer_phone
#  in_place_edit_for   :product, :status
  in_place_edit_for   :product, :finished_at
  def index
    @products = Product.all
  end
  
  def new
    render  :layout => false
  end
  
  def edit
    @product = Product.find_by_id(params[:id])
    render :layout => false
  end
  
  def show
    @product = Product.find_by_id(params[:id])
  end
  
  def create
    start_at = params[:temp].blank? ? Time.now : Date.new(params[:temp]["start(1i)"].to_i,params[:temp]["start(2i)"].to_i,params[:temp]["start(3i)"].to_i).to_time
    flash[:notice] = Product.create(params[:product].merge({:register_id=>current_user.id,:started_at => start_at})) ? "Successful" : "Fail"
    redirect_to admin_products_path
  end
  
  def update
    finish_at = params[:temp].blank? ? Time.now : Date.new(params[:temp]["finish(1i)"].to_i,params[:temp]["finish(2i)"].to_i,params[:temp]["finish(3i)"].to_i).to_time
    flash[:notice] = Product.find_by_id(params[:id]).update_attributes(params[:product].merge(:finished_at=>finish_at)) ? "Successful" : "Fail"
    redirect_to admin_products_path
  end
  
  def destroy
    flash[:notice] = Product.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_products_path
  end  
end
