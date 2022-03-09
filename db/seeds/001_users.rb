# frozen_string_literal: true

user_list = [
  %w[Ananta Jalil admin1@admin.com 123456 01711123456 ADMIN]
]

ActiveRecord::Base.transaction do
  user_list.each do |f_name, l_name, email, password, phone, role|
    user = User.find_or_create_by(email: email)
    user.first_name = f_name
    user.last_name = l_name
    user.password = password
    user.password_confirmation = password
    user.phone_number = phone
    user.user_role = role
    user.save
  end
end

puts '==========User Seed Completed============='
