# frozen_string_literal: true

# this class deals with tiny urls which can be used to download the files once uploaded
class ShortUrlService
  #
  # Method to generate the short url for the file
  #
  # @return [<Type>] short_url short url for the file
  #
  def self.generate_short_url
    # generate a random string
    short_url = SecureRandom.hex(3)
    # check if the short url is already present in the database
    short_url = SecureRandom.hex(3) while FileUploader.exists?(short_url: short_url)
    # return the short url
    short_url
  end
end
