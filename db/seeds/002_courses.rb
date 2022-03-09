# frozen_string_literal: true

course_list = [
  ['GK-101', 'Bangladesh'],
  ['CSE-105', 'C++']
]

ActiveRecord::Base.transaction do
  course_list.each do |code, title|
    course = Course.find_or_create_by(code: code)
    course.title = title
    course.save
  end
end

puts '==========Course Seed Completed============='
