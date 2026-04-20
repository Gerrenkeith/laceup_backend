class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json
  protected

  def configure_permitted_parameters
    # Allow :login during sign in
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email first_name last_name birthday username avatar])
    # Allow :username during sign up
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,:name, :email])
  end
end
