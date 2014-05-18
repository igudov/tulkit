json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :description, :image_url, :category, :status, :from, :to
  json.url job_url(job, format: :json)
end
