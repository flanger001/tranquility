class CreateStaff < ActiveRecord::Migration
  def change
    create_table :staff do |t|
      t.string :first_name
      t.string :last_name
      t.string :credentials
      t.string :photo
      t.text :title
      t.text :bio
      t.text :services
      t.text :notes

      t.timestamps null: false
    end
  end
end
