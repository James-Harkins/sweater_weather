require "rails_helper"

describe "road trip request" do
  describe "POST /api/v1/road_trip" do
    it "returns travel details between two locations, with weather data for the destination at the time of arrival", :vcr do
      user = User.create!(email: "test@testing.com", password: "test123", password_confirmation: "test123")

      json_payload = {
        origin: "Denver, CO",
        destination: "Pueblo, CO",
        api_key: user.api_key
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: json_payload.to_json

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

    it "still works when the travel time is greater than 8 hours", :vcr do
      user = User.create!(email: "test@testing.com", password: "test123", password_confirmation: "test123")

      json_payload = {
        origin: "New York, NY",
        destination: "Los Angeles, CA",
        api_key: user.api_key
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: json_payload.to_json

      expect(response).to have_http_status(201)

      response_body = JSON.parse(response.body, symbolize_names: true)
      road_trip = response_body[:data]

      expect(road_trip[:attributes][:travel_time]).to eq("40 hour(s) and 16 minutes")
      expect(road_trip[:attributes][:weather_at_eta][:temperature]).to be_a String
      expect(road_trip[:attributes][:weather_at_eta][:conditions]).to be_a String
    end

    it "will show an impossible travel time and an empty weather block for international travel", :vcr do
      user = User.create!(email: "test@testing.com", password: "test123", password_confirmation: "test123")

      json_payload = {
        origin: "Denver, CO",
        destination: "London, UK",
        api_key: user.api_key
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: json_payload.to_json

      expect(response).to have_http_status(201)

      response_body = JSON.parse(response.body, symbolize_names: true)
      road_trip = response_body[:data]

      expect(road_trip[:attributes][:travel_time]).to eq("impossible")
      expect(road_trip[:attributes][:weather_at_eta]).to eq({})
    end

    it "returns a 401 error if no api key is given" do
      json_payload = {
        origin: "Denver, CO",
        destination: "London, UK"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: json_payload.to_json

      expect(response).to have_http_status(401)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("unauthorized")
    end

    it "returns a 401 error if a bad api key is given" do
      json_payload = {
        origin: "Denver, CO",
        destination: "London, UK",
        api_key: "not_an_api_key"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: json_payload.to_json

      expect(response).to have_http_status(401)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("unauthorized")
    end
  end
end
