class RoadTripSerializer
  def self.serialize(road_trip_data)
    # travel_guide = TravelGuideFacade.generate_travel_guide(origin, destination)
    # destination_coordinates = travel_guide.destination_coordinates
    # if destination_coordinates
    #   destination_forecast = ForecastFacade.generate_forecast(destination_coordinates)
    # end
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: road_trip_data[:origin],
          end_city: road_trip_data[:destination],
          travel_time: road_trip_data[:travel_guide].format_travel_time,
          weather_at_eta: ForecastFacade.generate_forecast_by_travel_guide(road_trip_data[:travel_guide])
        }
      }
    }
  end
end
