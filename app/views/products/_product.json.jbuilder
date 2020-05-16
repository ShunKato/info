json.extract! product, :id, :p_code, :p_name, :cust, :supp, :comment, :created_at, :updated_at
json.url product_url(product, format: :json)
