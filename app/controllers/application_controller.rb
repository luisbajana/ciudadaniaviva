class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user  

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end


  def auth_user
    redirect_to "/auth/twitter" unless user_signed_in?
  end
    
  private  
  def current_user  
    @current_user ||= User.find(session[:id]) if session[:id]  
  end  

  def user_signed_in?
  	return true if current_user
  end

end
