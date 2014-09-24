class Assignment < ActiveRecord::Base
  belongs_to :boat
  belongs_to :timeslot
  has_many :bookings

  def availability
    boat_available? ? (boat.capacity - bookings.sum(:group_size)) : 0
  end

  def boat_overlapping_assignments
    Assignment.joins('LEFT JOIN timeslots ON timeslots.id = assignments.timeslot_id RIGHT JOIN bookings ON assignments.id = bookings.assignment_id')
              .where( "(assignments.boat_id = ?) AND ((timeslots.start_time BETWEEN ? AND ? OR timeslots.end_time BETWEEN ? AND ?) OR (timeslots.start_time <= ? AND timeslots.end_time >= ?))", 
                                          boat_id, timeslot.start_time, timeslot.end_time, timeslot.start_time, timeslot.end_time, timeslot.start_time, timeslot.end_time)
  end

  def boat_available?
    boat_overlapping_assignments.empty?
  end
end