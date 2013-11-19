json.array!(@surveys) do |survey|
  json.extract! survey, :topic_id, :name, :number_of_quesitons, :time_to_complete, :type
  json.url survey_url(survey, format: :json)
end