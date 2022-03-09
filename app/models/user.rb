class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exams

  def admin?
    user_role.eql? 'ADMIN'
  end

  def student?
    user_role.eql? 'STUDENT'
  end
end
