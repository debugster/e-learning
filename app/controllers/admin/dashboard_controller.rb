class Admin::DashboardController < AdminController
  def index
    @course_count = Course.count
  end
end
