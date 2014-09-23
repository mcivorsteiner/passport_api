require 'rails_helper'

describe Api::BoatsController do
  context "create" do
    it "responds successfully with correct params" do
      params = { boat: { name: "Amazon Express", capacity: 12 }}
      post :create, params
      expect(response).to be_success
    end

    it "responds with correct json structure and content" do
      params = { boat: { name: "Amazon Express", capacity: 12 }}
      post :create, params
      json = JSON.parse(response.body)
      expect(json.keys.length).to eq(3)
      expect(json["id"]).to be_a_kind_of(Integer)
      expect(json["capacity"]).to eq(12)
      expect(json["name"]).to eq("Amazon Express")
    end
  end
end