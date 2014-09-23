class Assignment < ActiveRecord::Base
  belongs_to :boat
  belongs_to :timeslot
  has_many :bookings

  def availability
    boat.capacity - bookings.sum(:group_size)
  end
end