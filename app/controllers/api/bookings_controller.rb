module Api
  class BookingsController < ApplicationController
    def create
      group_size = params['booking']['size'].to_i
      timeslot = Timeslot.find_by_id(params['booking']['timeslot_id'])
      if timeslot && (timeslot.max_availability >= group_size)
        assignment = timeslot.assignments_for_size(group_size).first
        assignment.bookings.create(group_size: group_size)
        render :json => { message: "Booking saved"}
      else
        render :json => { message: "Booking not saved.  Either no availability or not valid timeslot_id"}, status: 404
      end
    end
  end
end