class Timeslot < ActiveRecord::Base
  has_many :assignments
  has_many :boats, through: :assignments

  def boat_availabilities
    assignments.map { |assignment| assignment.availability }
  end

  def max_availability
    boat_availabilities.max
  end

  def boat_ids
    boats.map { |boat| boat.id }
  end
end