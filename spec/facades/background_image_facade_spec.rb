require "rails_helper"

describe BackgroundImageFacade do
  describe "class methods" do
    describe "#generate_background_image" do
      it "returns a BackgroundImage PORO for the return value of an UnsplashService.get_background_image_data call", :vcr do
        denver_background_image = BackgroundImageFacade.generate_background_image("denver,co")

        expect(denver_background_image).to be_a BackgroundImage
        expect(denver_background_image.image_url).to eq("https://images.unsplash.com/photo-1602967689755-6bc05c2d3c5b?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTE0Nzc2NA&ixlib=rb-1.2.1&q=80")
        expect(denver_background_image.credit).to be_a Hash
        expect(denver_background_image.credit[:source]).to eq("Unsplash")
        expect(denver_background_image.credit[:photographer_info]).to be_a Hash
        expect(denver_background_image.credit[:photographer_info][:name]).to eq("Acton Crawford")
        expect(denver_background_image.credit[:photographer_info][:username]).to eq("acton_crawford")
        expect(denver_background_image.credit[:photographer_info][:link]).to eq("https://api.unsplash.com/users/acton_crawford")
      end
    end
  end
end
