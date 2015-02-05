json.array!(@cart_details) do |cart_detail|
  json.extract! cart_detail, :id, :cart_id, :product_id, :quantity
  json.url cart_detail_url(cart_detail, format: :json)
end
