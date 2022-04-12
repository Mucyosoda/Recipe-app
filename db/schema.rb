
ActiveRecord::Schema[7.0].define(version: 2022_04_12_120420) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_tables", force: :cascade do |t|
    t.string "Food_name"
    t.integer "Unit"
    t.integer "Price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
