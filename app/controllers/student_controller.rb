class StudentController < ApplicationController
  before_action :check_student_access

  private

  def check_student_access
    if user_signed_in?
      unless current_user.student?
        redirect_to root_path
      end
    else
      redirect_to root_path, error: force_login_message
    end
  end
end
