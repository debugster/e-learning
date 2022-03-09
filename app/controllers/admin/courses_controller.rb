class Admin::CoursesController < AdminController
  before_action :set_course, only: %i[show edit update destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_courses_path,
                  success: 'Course has been created!'
    else
      render 'admin/courses/new'
    end
  end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to admin_courses_path,
                  success: 'Course has been updated!'
    else
      render 'admin/courses/edit'
    end
  end

  def show; end

  def destroy
    if @course.destroyable? && @course.destroy
      redirect_to admin_courses_path,
                  success: 'Course has been deleted!'
    else
      redirect_to admin_courses_path,
                  error: 'Course could not be deleted!'
    end
  end

  private

  def course_params
    params.require(:course).permit(:code, :title)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end

