json.array!(@topics) do |topic|
  json.extract! topic, :content, :grade
  json.url topic_url(topic, format: :json)
end