json.array!(@dimages) do |dimage|
  json.extract! dimage, :fotka, :flag, :descr
  json.url dimage_url(dimage, format: :json)
end