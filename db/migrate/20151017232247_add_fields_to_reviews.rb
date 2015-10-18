class AddFieldsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :show_customer_name, :boolean
    add_column :reviews, :date, :datetime
    rename_column :reviews, :author, :customer_name
  end
end
