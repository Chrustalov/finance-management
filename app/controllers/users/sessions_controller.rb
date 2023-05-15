# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create    
    user = User.find_by(email: params[:user][:email])

    if user.blank?
      set_flash_message!(:alert, :not_found_in_database)
      redirect_to new_user_session_path
    elsif !(user.valid_password?(params[:user][:password]))
      set_flash_message!(:alert, :invalid)
      session[:email] = params[:user][:email] if params[:user]
      super
    else
      self.resource = warden.authenticate!(auth_options)
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  # def after_sign_in_path_for(resource)
  #   main_configuration_path(subdomain: Subdomain.find_by(id: resource.subdomain_id).name)
  # end
end
