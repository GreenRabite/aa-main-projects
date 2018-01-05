class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= Session.find_by(session_token: session[:session_token]).user
  end

  def go_to_cat_index
    redirect_to cats_url unless current_user
  end

end
