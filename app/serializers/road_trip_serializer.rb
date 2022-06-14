class RoadTripSerializer
  def self.serialize(road_trip_data)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: road_trip_data[:origin],
          end_city: road_trip_data[:destination],
          travel_time: road_trip_data[:travel_guide].format_travel_time,
          weather_at_eta: road_trip_data[:forecast]
        }
      }
    }
  end
end
