require 'rails_helper'

describe Api::TimeslotsController do
  context "POST /api/timeslots endpoint" do
    it "responds successfully with correct params" do
      post :create, new_timeslot_params
      expect(response).to be_success
    end

    it "creates timeslot with correct params" do
      expect {
        post :create, new_timeslot_params
      }.to change { Timeslot.count }.by(1)
    end

    
  end
end