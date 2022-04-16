# frozen_string_literal: true

#
# Class FileUploader stores the file uploaded and the user associations
#
# @author Anoob Bava <anoob.bava@gmail.com>
#
class FileUploader < ApplicationRecord
  belongs_to :user
  has_one_attached :file_data

  #
  # This method deals with the file upload and configures the file name for uploader
  #
  # @return [String] which has the file name with the short url and this is fetched from credentials.yml
  #
  def url
    "#{Rails.application.credentials.host_name}/#{short_url}"
  rescue StandardError
    nil
  end
end
