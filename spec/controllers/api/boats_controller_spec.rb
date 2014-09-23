require 'rails_helper'

describe Api::BoatsController do
  context "POST /api/boats endpoint" do
    it "responds successfully with correct params" do
      post :create, new_boat_params
      expect(response).to be_success
    end

    it "responds with correct json structure and content" do
      post :create, new_boat_params

      json = JSON.parse(response.body)
      expect(json.keys.length).to eq(3)
      expect(json["id"]).to be_a_kind_of(Integer)
      expect(json["capacity"]).to eq(12)
      expect(json["name"]).to eq("Amazon Express")
    end

    it "creates boat with correct params" do
      expect {
        post :create, new_boat_params
      }.to change { Boat.count }.by(1)
    end
  end

  context "GET /api/boats endpoint" do
    it "responds succesfully" do
      get :index
      expect(response).to be_success
    end

    it "returns all existing boats" do
      3.times { post :create, new_boat_params }

      get :index

      json = JSON.parse(response.body)
      expect(json).to be_a_kind_of(Array)
      expect(json.length).to eq(3)
    end
  end
end