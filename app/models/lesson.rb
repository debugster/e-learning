class Lesson < ApplicationRecord
  MCQ_LIMIT = 10

  belongs_to :course
  has_many :mcqs, dependent: :destroy
  has_many :exams, dependent: :destroy

  accepts_nested_attributes_for :mcqs,
                                allow_destroy: true

  validates :title,
            :time_limit,
            presence: true
  validates_numericality_of :time_limit,
                            greater_than_or_equal_to: 0

  def destroyable?
    false
  end

  def latest_score_of(student_id)
    last_exam = exams.where(user_id: student_id).order('created_at desc').first
    if last_exam.nil?
      'N/A'
    else
      last_exam.score
    end
  end

  def max_score_of(student_id)
    all_exam = exams.where(user_id: student_id)
    if all_exam.nil?
      'N/A'
    else
      scores = []
      all_exam.each do |exam|
        scores << exam.score
      end
      scores.max
    end
  end
end
