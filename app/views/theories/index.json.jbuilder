json.array!(@theories) do |theory|
  json.extract! theory, :topic_id, :name, :theory_text
  json.url theory_url(theory, format: :json)
end