# frozen_string_literal: true

mcq_option_list = [
  [1, 'Hooghly River', false],
  [1, 'Ichamati River', true],
  [1, 'Brahmaputra River', false],
  [1, 'Surma River', false],

  [2, 'Japan', false],
  [2, 'China', false],
  [2, 'India', true],
  [2, 'Russia', false],

  [3, 'Jamuna', false],
  [3, 'Padma', false],
  [3, 'Buriganga', true],
  [3, 'Meghna', false],

  [4, '1947', false],
  [4, '1952', false],
  [4, '1969', false],
  [4, '1971', true],

  [5, 'Pakistan', true],
  [5, 'India', false],
  [5, 'Myanmar', false],
  [5, 'China', false],

  [6, 'Chattogram', false],
  [6, 'Dhaka', true],
  [6, 'Rajshahi', false],
  [6, 'Sylhet', false],

  [7, 'Strawberries', true],
  [7, 'Potatoes', false],
  [7, 'Rice', false],
  [7, 'Tea', false],

  [8, 'Africa', false],
  [8, 'South America', false],
  [8, 'Europe', false],
  [8, 'Asia', true],

  [9, 'Dhaka', false],
  [9, 'Chattogram', true],
  [9, 'Barishal', false],
  [9, 'Bogra', false],

  [10, 'Southern Ocean', false],
  [10, 'Pacific Ocean', false],
  [10, 'Indian Ocean', true],
  [10, 'Atlantic Ocean', false]
]

ActiveRecord::Base.transaction do
  mcq_option_list.each do |mcq_id, title, correct|
    McqOption.create(
      mcq_id: mcq_id,
      title: title,
      correct: correct
    )
  end
end

puts '==========MCQ Options Seed Completed============='
