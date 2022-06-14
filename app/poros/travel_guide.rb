class TravelGuide
  attr_reader :travel_time, :destination_coordinates
  def initialize(attributes)
    @travel_time = get_time_in_seconds(attributes)
    @destination_coordinates = get_destination_coordinates(attributes)
  end

  def get_time_in_seconds(attributes)
    if attributes[:route][:formattedTime]
      time = attributes[:route][:formattedTime]
      split_time = time.split(":").map { |dimension| dimension.to_i }[0..1]
      [(split_time[0] * 60), split_time[1]].sum * 60
    end
  end

  def get_destination_coordinates(attributes)
    if attributes[:route][:locations]
      {
        lat: attributes[:route][:locations][1][:displayLatLng][:lat],
        lon: attributes[:route][:locations][1][:displayLatLng][:lng]
      }
    end
  end

  def format_travel_time
    if travel_time
      "#{@travel_time / (60 * 60)} hour(s) and #{(@travel_time / 60) % 60} minutes"
    else
      "impossible"
    end
  end
end
