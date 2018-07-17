class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find((session)[:user_id])
    #as long as the request is active, the current user will be available
    end
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
