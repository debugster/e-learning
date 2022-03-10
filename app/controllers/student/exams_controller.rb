class Student::ExamsController < StudentController
  before_action :set_lesson, only: %i[new create show]
  before_action :set_exam, only: %i[show]

  def index
    @exams = current_user.exams
  end

  def new
    @exam = @lesson.exams.new
    @exam.exam_answers.build
  end

  def create
    @exam = @lesson.exams.new
    @exam.user = current_user
    @exam.save
    if @exam.create_exam_answers(params[:exam][:exam_answers])
      redirect_to student_lesson_exam_path(@lesson, @exam),
                  success: 'Exam has been finished!'
    else
      redirect_to new_student_lesson_exam_path,
                  error: 'Exam could not be finished!'
    end
  end

  def show
    @score = @exam.score
  end

  private

  def exam_params
    params.require(:exam).permit(
      :user_id, :lesson_id,
      exam_answers_attributes: ExamAnswer.attribute_names
                                         .map(&:to_sym)
                                         .push(:_destroy)
      )
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end
end
