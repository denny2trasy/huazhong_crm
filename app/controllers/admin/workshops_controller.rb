class Admin::WorkshopsController < ApplicationController
  in_place_edit_for :workshop, :name
  def index
    @workshops = Workshop.all
  end
  
  def new
   render :layout => false
  end
  
  def create 
    flash[:notice] = Workshop.create(params[:workshop]) ? "Successful" : "Fail"
    redirect_to admin_workshops_path
  end
  
  def destroy
    flash[:notice] = Workshop.find(params[:id]).destroy ? "Successful" : "Fail"
    redirect_to admin_workshops_path
  end  
end
