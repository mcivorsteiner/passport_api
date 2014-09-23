class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.belongs_to :assignment
      t.integer :group_size
      t.timestamps
    end
  end
end
