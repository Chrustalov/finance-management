class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
