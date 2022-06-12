require "rails_helper"

describe MapquestFacade do
  describe "class methods" do
    describe "#get_latitude_and_longitude" do
      it "returns a hash with keys of lat and long, which contain latitude and longitude data for some location", :vcr do
        denver = MapquestFacade.get_latitude_and_longitude("denver")

        expect(denver[:lat]).to eq(39.738453)
        expect(denver[:lon]).to eq(-104.984853)
      end
    end
  end
end
