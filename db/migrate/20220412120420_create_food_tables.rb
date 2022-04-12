class CreateFoodTables < ActiveRecord::Migration[7.0]
  def change
    create_table :food_tables do |t|
      t.string :Food_name
      t.integer :Unit
      t.integer :Price

      t.timestamps
    end
  end
end
