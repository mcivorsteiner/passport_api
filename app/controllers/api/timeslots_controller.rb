module Api
  class TimeslotsController < ApplicationController
    def create
      @timeslot = Timeslot.new(timeslot_params)
      if @timeslot.save
        render :json => { id: @timeslot.id, start_time: @timeslot.start_time.to_time.to_i, duration: @timeslot.duration, availability: 0, customer_count: 0, boats: []}
      else
        render :json => { message: "Issue with boat parameters"}, status: 404
      end
    end

    def index
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