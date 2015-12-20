class AddPositionColumn < ActiveRecord::Migration
  def change
    add_column :category_collections, :position, :integer
    add_column :categories, :position, :integer
    add_column :products, :position, :integer
  end
end
