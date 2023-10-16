class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.boolean :is_sales, default: true, null: false
      t.integer :cost, null: false
      t.text :explanation, null: false


      t.timestamps
    end
  end
end
