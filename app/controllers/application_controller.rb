class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, unless: :devise_controller?
  private

  def user_not_authorized
    flash[:alert] = "You don't have  permissions to perform this action."
    redirect_to root_path
  end
end
