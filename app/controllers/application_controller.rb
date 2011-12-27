# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :current_company, :user_default_branch, :current_day
  before_filter :require_user, :require_current_day

  private
   
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end  
  
  def current_company
    return @current_company if defined?(@current_company)    
    @current_company = current_user.company if current_user
  end

  def user_default_branch
    return @user_default_branch if defined?(@user_default_branch)    
    @user_default_branch = current_user.branch if current_user
  end

  def current_day
    return @current_day if defined?(@current_day)    
    @current_day = user_default_branch.default_current_open_day
  end
      
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to user_account_url
      return false
    end
  end

  def require_current_day
    redirect_to new_accounting_day_path if current_day.blank?
  end
    
  def store_location
    session[:return_to] = request.request_uri
  end
    
  def redirect_back_or_default(default)
    redirect_to default
    #redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end  
end
