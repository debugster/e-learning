class AdminController < ApplicationController
  before_action :check_admin_access

  private

  def check_admin_access
    if user_signed_in?
      unless current_user.admin?
        redirect_to root_path
      end
    else
      redirect_to root_path, error: force_login_message
    end
  end
end
