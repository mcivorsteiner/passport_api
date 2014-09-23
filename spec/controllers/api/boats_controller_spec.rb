require 'rails_helper'

describe Api::BoatsController do
  context "create" do
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
  end
end