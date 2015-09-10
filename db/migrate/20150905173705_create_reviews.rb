class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.boolean :active, default: false
      t.string :title
      t.string :author
      t.text :body
      t.integer :rating, limit: 1

      t.timestamps null: false
    end
  end
end
