module Api 
  class BoatsController < ApplicationController
    def create
      @boat = Boat.new(boats_params)
      if @boat.save
        render :json => @boat.api_response
      else
        render :json => { message: "Boat not saved. Check parameters"}, status: 400
      end
    end

    def index
      @boats = Boat.all.map { |boat| boat.api_response }
      render :json => @boats
    end

    private

    def boats_params
      params['boat'].permit(:capacity, :name)
    end
  end
end