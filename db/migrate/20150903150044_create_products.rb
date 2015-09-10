class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.string :name
      t.string :url
      t.string :description
      t.integer :price
      t.integer :reviews_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
