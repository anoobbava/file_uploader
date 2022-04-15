# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# create a user with a password
user = User.create!(email: 'admin@admin.com', password: 'password', password_confirmation: 'password')

# create a file uploaders
(1..10).each do |_i|
  FileUploader.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: User.last.id)
end
