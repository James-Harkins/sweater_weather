require "rails_helper"

describe Forecast do
  describe ".initialize" do
    it "exists and has attributes", :vcr do
      denver_forecast_data = OpenweatherService.get_forecast_data(denver_coordinates)
      binding.pry

      denver_forecast = Forecast.new(denver_forecast_data)

      denver_current_weather = {

      }

      expect(denver_forecast.current_weather).to eq(denver_current_weather)
      expect(denver_forecast.daily_weather).to eq(denver_daily_weather)
      expect(denver_forecast.hourly_weather).to eq(denver_hourly_weather)
    end
  end
end
