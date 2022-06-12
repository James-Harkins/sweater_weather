require "rails_helper"

describe OpenweatherService do
  describe "class methods" do
    describe "#get_forecast_data" do
      it "returns current, daily, and hourly forecast data for some set of coordinates" do
        denver_forecast_data = OpenweatherService.get_forecast_data(39.738453, -104.984853)

        expect(denver_forecast_data).to be_a Hash
        expect(denver_forecast_data[:current]).to be_a Hash
        expect(denver_forecast_data[:current][:dt]).to be_a String
        expect(denver_forecast_data[:current][:sunrise]).to be_a String
        expect(denver_forecast_data[:current][:sunset]).to be_a String
        expect(denver_forecast_data[:current][:temp]).to be_a Float
        expect(denver_forecast_data[:current][:humidity]).to be_an Integer
        expect(denver_forecast_data[:current][:uvi]).to be_a Float
        expect(denver_forecast_data[:current][:weather][0][:description]).to be_a String
        expect(denver_forecast_data[:current][:weather][0][:icon]).to be_a String

        denver_forecast_data[:hourly].each do |hour|
          expect(hour[:dt]).to be_a String
          expect(hour[:temp]).to be_a Float
          expect(hour[:weather][:description]).to be_a String
          expect(hour[:weather][:icon]).to be_a String
        end

        denver_forecast_data[:daily].each do |day|
          expect(day[:dt]).to be_a String
          expect(day[:sunrise]).to be_a String
          expect(day[:sunset]).to be_a String
          expect(day[:temp]).to be_a Hash
          expect(day[:temp][:day]).to be_a Float
          expect(day[:weather][:description]).to be_a String
          expect(day[:weather][:icon]).to be_a String
        end
      end
    end
  end
end
