class OpenweatherService
  def self.conn
    Faraday.new(url: "https://api.openweathermap.org") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.get_forecast_data(coordinates)
    response = conn.get("/data/2.5/onecall") do |c|
      c.params[:lat] = coordinates[:lat]
      c.params[:lon] = coordinates[:lon]
      c.params[:appid] = ENV["OPEN_WEATHER_API_KEY"]
      c.params[:units] = "imperial"
      c.params[:exclude] = "minutely,alerts"
    end
    results = JSON.parse(response.body, symbolize_names: true)
  end
end
