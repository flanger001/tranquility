class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :staff, index: true, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.string :day
      t.boolean :off

      t.timestamps null: false
    end
  end
end
