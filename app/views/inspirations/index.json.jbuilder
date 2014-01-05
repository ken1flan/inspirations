json.array!(@inspirations) do |inspiration|
  json.extract! inspiration, :id, :user_id, :title, :contents
  json.url inspiration_url(inspiration, format: :json)
end
