class Student::DashboardController < StudentController
  def index
    @lesson_count = Lesson.count
  end
end
