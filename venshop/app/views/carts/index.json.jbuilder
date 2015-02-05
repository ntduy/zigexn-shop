json.array!(@carts) do |cart|
  json.extract! cart, :id, :user_id, :status, :name, :email, :address, :phone
  json.url cart_url(cart, format: :json)
end
