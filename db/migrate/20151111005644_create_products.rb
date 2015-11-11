class CreateProducts < ActiveRecord::Migration
  def change
    execute "CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public"
    create_table :products do |t|
      t.string :title
      t.text :description
      t.hstore :properties
      t.string :picture
      t.string :category
      t.string :brand

      t.timestamps null: false
    end
  end
end
