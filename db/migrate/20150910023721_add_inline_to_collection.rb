class AddInlineToCollection < ActiveRecord::Migration
  def change
    add_column :category_collections, :inline, :boolean, default: false
  end
end
