class Exam < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  has_many :exam_answers, dependent: :destroy

  accepts_nested_attributes_for :exam_answers,
                                allow_destroy: true

  def score
    total_score = 0
    exam_answers.each do |answer|
      if McqOption.find(answer.selected_option).correct
        total_score += 1
      end
    end
    ((total_score * 1.0) / exam_answers.count) * 100.0
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
