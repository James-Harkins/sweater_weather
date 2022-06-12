require "rails_helper"

describe "forecast request" do
  describe "GET forecast for some location" do
    it "returns a forecast response including current, daily, and hourly weather data", :vcr do
      get "/api/v1/forecast", params: JSON.generate(location: "denver")

      response_body = JSON.parse(response.body, symbolize_names: true)
      forecast = response_body[:data]

      expect(forecast[:id]).to eq(nil)
      expect(forecast[:type]).to eq("forecast")
      expect(forecast[:attributes]).to have_key(:current_weather)
      expect(forecast[:attributes][:current_weather][:datetime]).to be_a Time
      expect(forecast[:attributes][:current_weather][:sunrise]).to be_a Time
      expect(forecast[:attributes][:current_weather][:sunset]).to be_a Time
      expect(forecast[:attributes][:current_weather][:temperature]).to eq(93.76)
      expect(forecast[:attributes][:current_weather][:humidity]).to eq(18)
      expect(forecast[:attributes][:current_weather][:uvi]).to eq(1.57)
      expect(forecast[:attributes][:current_weather][:visibility]).to eq(10000)
      expect(forecast[:attributes][:current_weather][:conditions]).to eq("broken clouds")
      expect(forecast[:attributes][:current_weather][:icon]).to eq("04d")

      expect(forecast[:attributes]).to have_key(:daily_weather)
      expect(forecast[:attributes][:daily_weather].count).to eq(5)

      forecast[:attributes][:daily_weather].each do |day|
        expect(day[:date]).to be_a Date
        expect(day[:sunrise]).to be_a Time
        expect(day[:sunset]).to be_a Time
        expect(day[:max_temp]).to be_a Float
        expect(day[:min_temp]).to be_a Float
        expect((day[:min_temp] < day[:max_temp])).to eq(true)
        expect(day[:conditions]).to be_a String
        expect(day[:icon]).to be_a String
      end

      expect(forecast[:attributes]).to have_key(:hourly_weather)
      expect(forecast[:attributes][:hourly_weather].count).to eq(8)

      forecast[:attributes][:hourly_weather].each do |hour|
        expect(hour[:time]).to be_a Time
        expect(hour[:temperature]).to be_a Float
        expect(hour[:conditions]).to be_a String
        expect(hour[:icon]).to be_a String
      end
    end
  end
end
