json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :admin, :activated, :activated_at, :reset_sent_at, :address, :phone
  json.url user_url(user, format: :json)
end
