json.extract! order, :id, :description, :control_number, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
