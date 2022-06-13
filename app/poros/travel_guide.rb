class TravelGuide
  attr_reader :travel_time, :destination_coordinates
  def initialize(attributes)
    @travel_time = get_time_in_seconds(attributes)
    @destination_coordinates = get_destination_coordinates(attributes)
  end

  def get_time_in_seconds(attributes)
    time = attributes[:route][:formattedTime]
    split_time = time.split(":").map { |dimension| dimension.to_i }[0..1]
    split_time_in_minutes = []
    split_time.each_with_index do |dimension, index|
      split_time_in_minutes << (index < 1 ? (dimension * 60) : dimension)
    end
    split_time_in_minutes.sum * 60
  end

  def get_destination_coordinates(attributes)
    {lat: attributes[:route][:locations][1][:displayLatLng][:lat],
     lon: attributes[:route][:locations][1][:displayLatLng][:lng]}
  end

  def format_travel_time
    "#{@travel_time / (60 * 60)} hour(s) and #{(@travel_time / 60) % 60} minutes"
  end
end
