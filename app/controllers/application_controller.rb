# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout "admin"
  def current_user
    User.find_by_login("admin")
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
