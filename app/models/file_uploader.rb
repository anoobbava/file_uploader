#
# Class FileUploader stores the file uploaded and the user associations
#
# @author Anoob Bava <anoob.bava@gmail.com>
#
class FileUploader < ApplicationRecord
  belongs_to :user
  has_one_attached :file_data
end
