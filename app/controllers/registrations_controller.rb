class RegistrationsController < Devise::RegistrationsController
  before_action :set_role, only: :new

  def after_sign_up_path_for(resource)
    edit_user_path(resource)
  end

  private

    def set_role
      session[:role] = params[:user_type]
    end
end
