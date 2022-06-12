class UnsplashService
  def self.conn
    Faraday.new(url: "https://api.unsplash.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.get_background_image_data(location)
    response = conn.get("/search/photos") do |c|
      c.params[:client_id] = ENV["UNSPLASH_ACCESS_KEY"]
      c.params[:query] = "#{location},skyline"
      c.params[:orientation] = "landscape"
    end
    results = JSON.parse(response.body, symbolize_names: true)[:results][0]
  end
end
