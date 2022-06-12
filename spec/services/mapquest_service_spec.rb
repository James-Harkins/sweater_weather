require "rails_helper"

describe MapquestService do
  describe "class methods" do
    describe "#get_location_data" do
      it "returns a hash containing data for some location argument" do
        location_data = MapquestService.get_location_data("denver")
        expect(location_data).to be_a Hash
        expect(location_data).to have_key(:info)
        expect(location_data[:info]).to be_a Hash
        expect(location_data).to have_key(:options)
        expect(location_data[:options]).to be_a Hash
        expect(location_data).to have_key(:results)
        expect(location_data[:results]).to be_an Array
        expect(location_data[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
        expect(location_data[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
      end
    end
  end
end
