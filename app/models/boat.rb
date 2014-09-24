class Boat < ActiveRecord::Base
  has_many :assignments
  has_many :timeslots, through: :assignments
  has_many :bookings, through: :assignments

  def api_response
    {
      id:       id,
      capacity: capacity,
      name:     name
    }
  end
end