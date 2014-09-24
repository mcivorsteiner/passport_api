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

    it "has correct json response" do
      post :create, new_timeslot_params

      json = JSON.parse(response.body)
      expect(json.keys.length).to eq(6)
      expect(json["id"]).to be_a_kind_of(Integer)
      expect(json["start_time"].to_s).to eq(new_timeslot_params['timeslot']['start_time'])
      expect(json["duration"].to_s).to eq(new_timeslot_params['timeslot']['duration'])
    end

  end

  context "GET /api/timeslots endpoint" do
    it "responds successfully with correct params" do
      get :index, 'date' => '2014-10-10'
      expect(response).to be_success
    end

    it "returns all timeslots on day sent in params" do
      3.times { post :create, new_timeslot_params }

      get :index, 'date' => '2014-09-23'
      
      json = JSON.parse(response.body)
      expect(json).to be_a_kind_of(Array)
      expect(json.length).to eq(3)
    end
  end
end