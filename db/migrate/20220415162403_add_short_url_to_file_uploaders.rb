# frozen_string_literal: true

class AddShortUrlToFileUploaders < ActiveRecord::Migration[6.0]
  def up
    add_column :file_uploaders, :short_url, :string
  end

  def down
    remove_column :file_uploaders, :short_url
  end
end
