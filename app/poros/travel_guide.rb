class TravelGuide
  attr_reader :travel_time, :destination_coordinates
  def initialize(attributes)
    @travel_time = attributes[:route][:realTime]
    @destination_coordinates = get_destination_coordinates(attributes)
  end

  def get_destination_coordinates(attributes)
    {lat: attributes[:route][:locations][1][:displayLatLng][:lat],
     lon: attributes[:route][:locations][1][:displayLatLng][:lng]}
  end

  def format_travel_time
    "#{@travel_time / (60 * 60)} hours and #{(@travel_time / 60) % 60} minutes"
  end
end
