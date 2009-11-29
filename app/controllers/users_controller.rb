class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
#  include AuthenticatedSystem
  
  def index
    @users = User.all
  end
  
  # render new.rhtml
  def new
  end
  
#  def create
#    encrypt_pwd = encrypt(params[:user][:password])
#    salt = 
#    user = User.new(params[:user].merge({:crypted_password=>encrypt_pwd}))
#    debugger
#    flash[:notice] = (user and user.save and user.errors.empty?) ? "Successful" : "Fail"
#    redirect_to users_path
#  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_to users_path
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
