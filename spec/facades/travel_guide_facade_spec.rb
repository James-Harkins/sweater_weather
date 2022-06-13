require "rails_helper"

describe TravelGuideFacade do
  describe "class methods" do
    describe "#generate_travel_guide" do
      it "returns a TravelGuide PORO based on an origin and destination passed in as arguments", :vcr do
        travel_guide = TravelGuideFacade.generate_travel_guide("Denver, CO", "Pueblo, CO")
        pueblo_coordinates = {
          lon: -104.610413,
          lat: 38.265427
        }

        expect(travel_guide).to be_a TravelGuide
        expect(travel_guide.travel_time).to eq(6300)
        expect(travel_guide.destination_coordinates).to eq(pueblo_coordinates)
      end
    end
  end
end
