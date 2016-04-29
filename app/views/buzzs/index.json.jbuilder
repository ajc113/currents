json.array!(@buzzs) do |buzz|
  json.extract! buzz, :id, :post
  json.url buzz_url(buzz, format: :json)
end
