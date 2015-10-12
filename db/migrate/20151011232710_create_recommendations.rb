class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :name
      t.text :description
      t.string :url
      t.boolean :active

      t.timestamps null: false
    end
  end
end
