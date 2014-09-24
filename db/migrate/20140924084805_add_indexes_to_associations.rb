class AddIndexesToAssociations < ActiveRecord::Migration
  def change
    add_index :assignments, :timeslot_id
    add_index :assignments, :boat_id

    add_index :bookings, :assignment_id
  end
end
