class Exam < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  has_many :exam_answers, dependent: :destroy

  accepts_nested_attributes_for :exam_answers,
                                allow_destroy: true

  def score
    score_details = {
      total_mcq: lesson.mcqs.count,
      correctly_answered: 0,
      percentage: 0.0
    }
    exam_answers.each do |answer|
      if McqOption.find(answer.selected_option).correct
        score_details[:correctly_answered] += 1
      end
    end
    score_details[:percentage] =
      ((score_details[:correctly_answered] * 1.0) /
        score_details[:total_mcq]) * 100.0
    score_details
  end

  def create_exam_answers(data)
    ActiveRecord::Base.transaction do
      data.each do |key, value|
        answer = exam_answers.new
        answer.mcq_id = key
        answer.selected_option = value[:selected_option]
        answer.save
      end
    end
  end
end
