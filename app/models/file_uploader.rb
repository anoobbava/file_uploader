#
# Class FileUploader stores the file uploaded and the user associations
#
# @author Anoob Bava <anoob.bava@gmail.com>
#
class FileUploader < ApplicationRecord
  belongs_to :user
end
