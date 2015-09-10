class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :url
      t.boolean :inline, default: false, null: false
      t.integer :products_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
