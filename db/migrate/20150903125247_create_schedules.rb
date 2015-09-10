class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.belongs_to :staff, index: true, foreign_key: true
      t.text :notes
      t.integer :events_count, default: 0, null: false

      t.timestamps null: false
    end
  end
end
