class AddUrlToStaff < ActiveRecord::Migration[5.2]
  def change
    add_column :staff, :url, :string
  end
end
