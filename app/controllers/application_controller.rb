class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_calendar

  private

  #def current_user
  #  @current_calendar ||= Calendar.find(session[:calendar_id]) if session[:calendar_id]
  #end

end
