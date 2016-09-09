class RegistrationsController < Devise::RegistrationsController

	before_filter :configure_permitted_parameters

	protected

    def after_sign_up_path_for(resource)
      '/categories'
    end

  	def configure_permitted_parameters
   	 devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :monthly_payment,
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :monthly_payment, :current_password,
        :email, :password, :password_confirmation)
    end
  end
end