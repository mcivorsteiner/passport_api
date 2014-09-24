require 'rails_helper'

describe Api::BookingsController do
  let!(:boat) { FactoryGirl.create :boat }
  let!(:timeslot) { FactoryGirl.create :timeslot }
  let!(:assignment) { Assignment.create( timeslot_id: timeslot.id, boat_id: boat.id )}

  context "POST /api/bookings endpoint" do
    it "responds with success when valid params are passed" do
      params = { 'booking' => { 'timeslot_id' => timeslot.id, 'size' => boat.capacity}}
      post :create, params
      expect(response).to be_success
    end

    it "responds with status 404 when invalid timeslot_id passed" do
      params = { 'booking' => { 'timeslot_id' => 1_000_000, 'size' => boat.capacity}}
      post :create, params
      expect(response).to_not be_success
    end

    it "responds with status 404 when no availability for group size" do
      params = { 'booking' => { 'timeslot_id' => timeslot.id, 'size' => '100'}}
      post :create, params
      expect(response).to_not be_success
    end

    it "creates a booking when valid parameters are sent" do
      params = { 'booking' => { 'timeslot_id' => timeslot.id, 'size' => boat.capacity}}
      expect {
        post :create, params
      }.to change { Booking.count }.by(1)
    end
  end
end