json.array!(@bids) do |bid|
  json.extract! bid, :id, :description, :price, :image_url, :user_id, :job_id
  json.url bid_url(bid, format: :json)
end
