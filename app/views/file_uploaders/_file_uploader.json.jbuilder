json.extract! file_uploader, :id, :title, :description, :created_at, :updated_at
json.url file_uploader_url(file_uploader, format: :json)
