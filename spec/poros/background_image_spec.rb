require "rails_helper"

describe BackgroundImage do
  describe ".initialize" do
    it "exists and has attributes" do
      denver_background_image_data = {
        id: "RCgHzFW7yxY",
        created_at: "2020-10-17T18:24:25-04:00",
        updated_at: "2022-06-11T20:14:55-04:00",
        promoted_at: nil,
        width: 9083,
        height: 1702,
        color: "#73c0d9",
        blur_hash: "LwHfbURlWBW=K-s,t6flx]aea}ay",
        description: "Downtown Denver from the Museum of Natural Science",
        alt_description: nil,
        urls: {raw: "https://images.unsplash.com/photo-1602967689755-6bc05c2d3c5b?ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTA2MTI1Mw&ixlib=rb-1.2.1",
               full: "https://images.unsplash.com/photo-1602967689755-6bc05c2d3c5b?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTA2MTI1Mw&ixlib=rb-1.2.1&q=80",
               regular: "https://images.unsplash.com/photo-1602967689755-6bc05c2d3c5b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTA2MTI1Mw&ixlib=rb-1.2.1&q=80&w=1080",
               small: "https://images.unsplash.com/photo-1602967689755-6bc05c2d3c5b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTA2MTI1Mw&ixlib=rb-1.2.1&q=80&w=400",
               thumb: "https://images.unsplash.com/photo-1602967689755-6bc05c2d3c5b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTA2MTI1Mw&ixlib=rb-1.2.1&q=80&w=200",
               small_s3: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1602967689755-6bc05c2d3c5b"},
        links: {self: "https://api.unsplash.com/photos/RCgHzFW7yxY",
                html: "https://unsplash.com/photos/RCgHzFW7yxY",
                download: "https://unsplash.com/photos/RCgHzFW7yxY/download?ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTA2MTI1Mw",
                download_location: "https://api.unsplash.com/photos/RCgHzFW7yxY/download?ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTA2MTI1Mw"},
        categories: [],
        likes: 6,
        liked_by_user: false,
        current_user_collections: [],
        sponsorship: nil,
        topic_submissions: {},
        user: {id: "iReUjmhpLcw",
               updated_at: "2022-06-12T09:33:18-04:00",
               username: "acton_crawford",
               name: "Acton Crawford",
               first_name: "Acton",
               last_name: "Crawford",
               twitter_username: nil,
               portfolio_url: nil,
               bio: "I'm an amateur who likes to shoot just about everything that looks interesting. I want to get more experience with portraiture.  Attribution and donations are appreciated please and thank you.",
               location: "Aurora, CO, USA",
               links: {self: "https://api.unsplash.com/users/acton_crawford",
                       html: "https://unsplash.com/@acton_crawford",
                       photos: "https://api.unsplash.com/users/acton_crawford/photos",
                       likes: "https://api.unsplash.com/users/acton_crawford/likes",
                       portfolio: "https://api.unsplash.com/users/acton_crawford/portfolio",
                       following: "https://api.unsplash.com/users/acton_crawford/following",
                       followers: "https://api.unsplash.com/users/acton_crawford/followers"},
               profile_image: {small: "https://images.unsplash.com/profile-1651019538846-fd870c86a88eimage?ixlib=rb-1.2.1&crop=faces&fit=crop&w=32&h=32",
                               medium: "https://images.unsplash.com/profile-1651019538846-fd870c86a88eimage?ixlib=rb-1.2.1&crop=faces&fit=crop&w=64&h=64",
                               large: "https://images.unsplash.com/profile-1651019538846-fd870c86a88eimage?ixlib=rb-1.2.1&crop=faces&fit=crop&w=128&h=128"},
               instagram_username: nil,
               total_collections: 0,
               total_likes: 41,
               total_photos: 411,
               accepted_tos: true,
               for_hire: true,
               social: {instagram_username: nil, portfolio_url: nil, twitter_username: nil, paypal_email: nil}},
        tags: []
      }

      denver_background_image = BackgroundImage.new(denver_background_image_data)

      expect(denver_background_image).to be_a BackgroundImage
      expect(denver_background_image.image_url).to eq("https://images.unsplash.com/photo-1602967689755-6bc05c2d3c5b?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzMzY1Mzh8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyQ3NreWxpbmV8ZW58MHwwfHx8MTY1NTA2MTI1Mw&ixlib=rb-1.2.1&q=80")
      expect(denver_background_image.credit).to be_a Hash
      expect(denver_background_image.credit[:source]).to eq("Unsplash")
      expect(denver_background_image.credit[:photographer_info]).to be_a Hash
      expect(denver_background_image.credit[:photographer_info][:name]).to eq("Acton Crawford")
      expect(denver_background_image.credit[:photographer_info][:username]).to eq("acton_crawford")
      expect(denver_background_image.credit[:photographer_info][:link]).to eq("https://api.unsplash.com/users/acton_crawford")
    end
  end
end
