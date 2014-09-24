module Api
  class TimeslotsController < ApplicationController
    def create
      @timeslot = Timeslot.new(timeslot_params)
      if @timeslot.save
        render :json => @timeslot.api_response
      else
        render :json => { message: "Issue with boat parameters"}, status: 404
      end
    end

    def index
      date = Time.parse(params['date'])
      @timeslots = Timeslot.where(start_time: date.beginning_of_day..date.end_of_day)
      render :json => @timeslots.map{ |timeslot| timeslot.api_response }
    end

    private

    def timeslot_params
      start_time = unix_time_to_datetime(params['timeslot']['start_time'])
      { start_time: start_time, duration: params['timeslot']['duration']}
    end

    def unix_time_to_datetime(unix_time)
      Time.at(unix_time.to_i).to_datetime
    end

  end
end