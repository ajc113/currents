json.array!(@users) do |user|
  json.extract! user, :id, :email, :home_port, :boat_name
  json.url user_url(user, format: :json)
end
