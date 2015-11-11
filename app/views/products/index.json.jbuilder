json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :properties, :picture, :category, :brand
  json.url product_url(product, format: :json)
end
