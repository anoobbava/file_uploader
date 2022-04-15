# frozen_string_literal: true

class AddUserAssociationsToFileUploaders < ActiveRecord::Migration[6.0]
  def up
    add_column :file_uploaders, :user_id, :integer
  end

  def down
    remove_column :file_uploaders, :user_id
  end
end
