json.extract! food_table, :id, :Food_name, :Unit, :Price, :created_at, :updated_at
json.url food_table_url(food_table, format: :json)
