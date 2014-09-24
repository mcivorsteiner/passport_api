module Api
  class AssignmentsController < ApplicationController
    def create
      boat = Boat.find_by_id(params['assignment']['boat_id'])
      timeslot = Timeslot.find_by_id(params['assignment']['timeslot_id'])
      if boat && timeslot
        timeslot.boats << boat
        render :json => { message: "Assignment saved"}
      else
        render :json => { message: "Assignment not saved.  Check existence and vallidity of parameters"}, status: 404
      end
    end
  end
end