# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# create a user with a password
User.create!(email: 'admin@admin.com', password: 'admin@admin.com', password_confirmation: 'admin@admin.com')

# create a file uploaders
(1..10).each do |i|
  uploader = FileUploader.new(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph,
                              user_id: User.last.id)
  uploader.short_url = ShortUrlService.generate_short_url
  uploader.file_data.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')),
                            filename: "image_#{i}.jpg", content_type: 'image/jpg')
  uploader.save!
end
