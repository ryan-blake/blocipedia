class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :configure_permitted_parameter, if: :devise_controller?

  protected

  def configure_permitted_parameter
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password)}
  end
end
