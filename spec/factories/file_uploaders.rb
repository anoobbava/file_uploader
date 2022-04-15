# frozen_string_literal: true

FactoryBot.define do
  factory :file_uploader do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    user_id { create(:user).id }
  end
end
