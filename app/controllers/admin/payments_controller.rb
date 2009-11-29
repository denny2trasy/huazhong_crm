class Admin::PaymentsController < ApplicationController

  before_filter :get_product
  def index
    @payments = @product.payments
  end
  def new
    render :layout => false
  end
  
  def create
    pay_at = params[:temp].blank? ? Time.now : Date.new(params[:temp]["at(1i)"].to_i,params[:temp]["at(2i)"].to_i,params[:temp]["at(3i)"].to_i).to_time
    flash[:notice] = @product.payments.create(params[:payment].merge({:pay_at=>pay_at})) ? "Successful" : "Fail"
    redirect_to admin_product_path(@product)
  end
  
  def destroy
    flash[:notice] = Payment.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_product_path(@product)
  end
  
  private
  def get_product
    @product = Product.find_by_id(params[:product_id])
  end  
end
