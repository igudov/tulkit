json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :avatar_url, :phone, :bidder, :info
  json.url user_url(user, format: :json)
end
