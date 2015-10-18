class AddActiveToCategoriesAndCollections < ActiveRecord::Migration
  def change
    add_column :categories, :active, :boolean, default: false
    add_column :category_collections, :active, :boolean, default: false
  end
end
