class Timeslot < ActiveRecord::Base
  has_many :assignments
  has_many :boats, through: :assignments
  has_many :bookings, through: :assignments

  def boat_availabilities
    assignments.map { |assignment| assignment.availability }
  end

  def max_availability
    boat_availabilities.max
  end

  def boat_ids
    boats.map { |boat| boat.id }
  end

  def customer_count
    bookings.sum(:group_size)
  end

  def assignments_for_size(group_size)
    assignments.select { |assignment| assignment.availability >= group_size }
  end

  def api_response
    { 
      id: id, 
      start_time: start_time.to_time.to_i, 
      duration: duration, 
      availability: max_availability, 
      customer_count: customer_count, 
      boats: boat_ids
    }
  end
end