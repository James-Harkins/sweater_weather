class MapquestService
  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.get_location_data(location)
    response = conn.get("/geocoding/v1/address") do |c|
      c.params[:key] = ENV["MAPQUEST_API_KEY"]
      c.params[:location] = location
    end
    results = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_directions(origin, destination)
    response = conn.get("/directions/v2/route") do |c|
      c.params[:key] = ENV["MAPQUEST_API_KEY"]
      c.params[:from] = origin
      c.params[:to] = destination
    end
    results = JSON.parse(response.body, symbolize_names: true)
  end
end
