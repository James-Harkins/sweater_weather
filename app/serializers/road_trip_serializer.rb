class RoadTripSerializer
  def self.serialize(origin, destination)
    travel_guide = TravelGuideFacade.generate_travel_guide(origin, destination)
    destination_coordinates = travel_guide.destination_coordinates
    if destination_coordinates
      destination_forecast = ForecastFacade.generate_forecast(destination_coordinates)
    end
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: travel_guide.format_travel_time,
          weather_at_eta:
            if destination_forecast
              destination_forecast.weather_at_eta(travel_guide.travel_time)
            else
              {}
            end
        }
      }
    }
  end
end
