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
end
