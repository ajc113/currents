json.array!(@locations) do |location|
  json.extract! location, :id, :short_name, :long_name
  json.url location_url(location, format: :json)
end
