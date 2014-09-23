module Api 
  class BoatsController < ApplicationController
    def create
      @boat = Boat.new(boats_params)
      if @boat.save
        render :json => { id: @boat.id, capacity: @boat.capacity, name: @boat.name }
      else
        render :json => { message: "Issue with boat parameters"}, status: 404
      end
    end

    def index
      @boats = Boat.all.map do |boat|
        { id: boat.id, capacity: boat.capacity, name: boat.name }
      end
      render :json => @boats
    end

    private

    def boats_params
      params['boat'].permit(:capacity, :name)
    end
  end
end