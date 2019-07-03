class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :first_name,
        :last_name,
        :email,
        :phone_number,
        :password,
        :password_confirmation,
        :time_zone,
        :university,
        :guardian_email,
        :guardian_phone,
      )
    end

    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end
