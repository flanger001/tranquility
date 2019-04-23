class AddMissingIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :products, :url
    add_index :categories, :url
    add_index :category_collections, :url
  end
end
