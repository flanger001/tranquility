class AddMissingForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :categories, :category_collections
    add_foreign_key :events, :schedules
    add_foreign_key :snippet_collections, :category_collections
    add_foreign_key :snippets, :snippet_collections
  end
end
