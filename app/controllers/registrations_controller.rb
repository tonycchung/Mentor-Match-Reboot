class RegistrationsController < Devise::RegistrationsController
  before_action :set_role, only: :new
  before_action :set_confirmation

  def after_sign_up_path_for(resource)
    edit_user_path(resource)
  end

  private

    def set_role
      session[:role] = params[:user_type]
    end

    def set_confirmation
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:password, :password_confirmation, :email, :role)}
    end
end
