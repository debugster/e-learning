class Course < ApplicationRecord
  has_many :lessons, dependent: :destroy

  validates :code,
            :title,
            presence: true
  validates :code,
            uniqueness: true

  def destroyable?
    false
  end
end
