json.extract! recipe_list, :id, :name, :description, :created_at, :updated_at
json.url recipe_list_url(recipe_list, format: :json)
