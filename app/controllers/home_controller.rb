class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to student_dashboard_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
