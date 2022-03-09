# frozen_string_literal: true

mcq_list = [
  [1, 'Which river flows across the India-Bangladesh border?'],
  [1, 'The Asian nation of Bangladesh is almost completely enveloped by one country. Which nation has a large land border with Bangladesh?'],
  [1, 'Dhaka is capital of Bangladesh. On which river it is situated?'],
  [1, 'The nation of Bangladesh was formed from the historic region of Bengal. In which year did it gain independence?'],
  [1, 'Bangladesh officially gained independence from which nation?'],
  [1, 'Which city became the capital of Bangladesh when it gained independence?'],
  [1, 'Due to its high soil fertility, a large percentage of Bangladeshi people rely on agriculture to make a living. Which of these crops are you least likely to find growing in Bangladesh?'],
  [1, 'On which continent is Bangladesh located?'],
  [1, 'Which city is called the Healthy City of Bangladesh?'],
  [1, 'Bangladesh borders the Bay of Bengal to the south. Which ocean is the Bay of Bengal a part of?']
]

ActiveRecord::Base.transaction do
  mcq_list.each do |lesson_id, title|
    Mcq.create(
      lesson_id: lesson_id,
      title: title
    )
  end
end

puts '==========MCQ Seed Completed============='
