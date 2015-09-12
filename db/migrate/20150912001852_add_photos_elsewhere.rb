class AddPhotosElsewhere < ActiveRecord::Migration
  def change
    add_column :products, :photo, :string
    add_column :categories, :photo, :string
  end
end
