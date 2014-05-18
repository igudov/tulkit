json.array!(@documents) do |document|
  json.extract! document, :id, :user_id, :direct_upload_url, :upload, :processed
  json.url document_url(document, format: :json)
end
