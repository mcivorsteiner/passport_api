require 'rails_helper'

describe Api::AssignmentsController do
  let!(:boat) { FactoryGirl.create :boat }
  let!(:timeslot) { FactoryGirl.create :timeslot }
  
  context "POST /api/assignments endpoint" do
    it "responds with success when valid params are passed" do
      params = { 'assignment' => { 'boat_id' => boat.id, 'timeslot_id' => timeslot.id }}
      post :create, params
      expect(response).to be_success
    end

    it "responds with status 404 when invalid params are passed" do
      params = { 'assignment' => { 'boat_id' => 1_000_000, 'timeslot_id' => 1 }}
      post :create, params
      expect(response).to_not be_success
    end

    it "creates correct assignment when valid param are passed" do
      params = { 'assignment' => { 'boat_id' => boat.id, 'timeslot_id' => timeslot.id }}
      expect {
        post :create, params
      }.to change { Assignment.count }.by(1)
    end
  end
end