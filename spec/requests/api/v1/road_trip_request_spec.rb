require "rails_helper"

describe "road trip request" do
  describe "POST /api/v1/road_trip" do
    it "returns travel details between two locations, with weather data for the destination at the time of arrival" do
      user = User.create!(email: "test@testing.com", password: "test123", password_confirmation: "test123")

      json_payload = {
        origin: "Denver, CO",
        destination: "Pueblo, CO",
        api_key: user.api_key
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: json_payload.to_json, as: :json

      expect(response).to have_http_status(201)

      response_body = JSON.parse(response.body, symbolize_names: true)
      road_trip = response_body[:data]

      data_keys = [:id, :type, :attributes]
      attributes_keys = [:start_city, :end_city, :travel_time, :weather_at_eta]
      weather_at_eta_keys = [:temperature, :conditions]

      expect(road_trip.keys).to eq(data_keys)
      expect(road_trip[:id]).to eq(nil)
      expect(road_trip[:type]).to eq("roadtrip")
      expect(road_trip[:attributes]).to be_a Hash

      expect(road_trip[:attributes].keys).to eq(attributes_keys)
      expect(road_trip[:attributes][:start_city]).to eq(json_payload[:origin])
      expect(road_trip[:attributes][:end_city]).to eq(json_payload[:destination])
      expect(road_trip[:attributes][:travel_time]).to be_a String
      expect(road_trip[:attributes][:weather_at_eta]).to be_a Hash

      expect(road_trip[:attributes][:weather_at_eta][:temperature]).to be_a String
      expect(road_trip[:attributes][:weather_at_eta][:conditions]).to be_a String
    end
  end
end
