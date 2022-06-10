json.extract! order, :id, :firstname, :lastname, :value, :mobile, :address, :created_at, :updated_at
json.url order_url(order, format: :json)
