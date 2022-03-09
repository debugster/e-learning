# frozen_string_literal: true

lesson_list = [
  [1, 'About Bangladesh', 60]
]

ActiveRecord::Base.transaction do
  lesson_list.each do |course_id, title, time_limit|
    Lesson.create(
      course_id: course_id,
      title: title,
      time_limit: time_limit
    )
  end
end

puts '==========Lesson Seed Completed============='
