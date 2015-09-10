class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.string :title
      t.text :body
      t.references :category

      t.timestamps null: false
    end
  end
end
