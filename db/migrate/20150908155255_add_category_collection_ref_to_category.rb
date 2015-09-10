class AddCategoryCollectionRefToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :category_collection
  end
end
