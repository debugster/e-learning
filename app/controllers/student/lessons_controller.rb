class Student::LessonsController < StudentController
  def index
    @lessons = Lesson.all.includes(:course)
  end
end
