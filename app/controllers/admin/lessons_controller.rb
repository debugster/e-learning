class Admin::LessonsController < AdminController
  before_action :set_course, only: %i[new create show edit update destroy]
  before_action :set_lesson, only: %i[show edit update destroy]

  def index; end

  def new
    @lesson = Lesson.new
    Lesson::MCQ_LIMIT.times do
      @lesson.mcqs.build
    end
  end

  def create
    @lesson = @course.lessons.new(lesson_params)
    if @lesson.save
      redirect_to admin_course_lesson_path(@course, @lesson),
                  success: 'Lesson has been created!'
    else
      render 'admin/lessons/new'
    end
  end

  def edit; end

  def update
    if @lesson.update(lesson_params)
      redirect_to admin_course_lesson_path(@course, @lesson),
                  success: 'Lesson has been updated!'
    else
      render 'admin/lessons/edit'
    end
  end

  def destroy
    if @lesson.destroyable? && @lesson.destroy
      redirect_to admin_course_path(@course),
                  success: 'Lesson has been deleted!'
    else
      redirect_to admin_course_path(@course),
                  error: 'Lesson could not be deleted!'
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(
      :title, :time_limit,
      mcqs_attributes: Mcq.attribute_names
                          .map(&:to_sym)
                          .push(:_destroy,
                                mcq_options_attributes: McqOption.attribute_names
                                                                 .map(&:to_sym)
                                                                 .push(:_destroy)
                          )
    )
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
