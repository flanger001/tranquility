class ChangeOwnershipOfEvents < ActiveRecord::Migration
  def change
    add_reference :events, :schedule
    remove_reference :events, :staff
  end
end
