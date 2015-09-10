class CreateCategoryCollections < ActiveRecord::Migration
  def change
    create_table :category_collections do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps null: false
    end
  end
end
