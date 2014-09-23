class Assignment < ActiveRecord::Base
  belongs_to :boat
  belongs_to :timeslot
  has_many :bookings
end