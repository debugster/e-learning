class Mcq < ApplicationRecord
  belongs_to :lesson
  has_many :mcq_options, dependent: :destroy

  accepts_nested_attributes_for :mcq_options,
                                allow_destroy: true

  validates :title,
            presence: true
end
