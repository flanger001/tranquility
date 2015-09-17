class CreateSnippetCollections < ActiveRecord::Migration
  def change
    create_table :snippet_collections do |t|
      t.string :name
      t.string :title
      t.text :description
      t.references :category_collection

      t.timestamps null: false
    end
  end
end
