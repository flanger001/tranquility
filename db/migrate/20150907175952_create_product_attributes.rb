class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.integer :time
      t.integer :price

      t.timestamps null: false
    end
  end
end
