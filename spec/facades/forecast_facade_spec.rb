require "rails_helper"

describe ForecastFacade do
  describe "class methods" do
    describe "#generate_forecast" do
      it "returns a Forecast PORO for some set of coordinates", :vcr do
        denver_coordinates = {lat: 39.738453, lon: -104.984853}
        denver_forecast = ForecastFacade.generate_forecast(denver_coordinates)

        expect(denver_forecast).to be_a Forecast
      end
    end
  end
end
