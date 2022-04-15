class CreateFileUploaders < ActiveRecord::Migration[6.0]
  def change
    create_table :file_uploaders do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
