require "rails_helper"

describe UnsplashService do
  describe "class methods" do
    describe "#get_background_image_data" do
      it "returns data for some background image based on location data passed in as an argument", :vcr do
        denver_background_data = UnsplashService.get_background_image_data("denver,co")

        expect(denver_background_data).to be_a Hash
        expect(denver_background_data[:id]).to be_a String
        expect(denver_background_data[:created_at]).to be_a String
        expect(denver_background_data[:updated_at]).to be_a String
        expect(denver_background_data[:color]).to be_a String
        expect(denver_background_data[:description]).to be_a String
        expect(denver_background_data[:urls]).to be_a Hash
        expect(denver_background_data[:links]).to be_a Hash
        expect(denver_background_data[:user]).to be_a Hash
      end
    end
  end
end
