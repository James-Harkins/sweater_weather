class TravelGuideFacade
  def self.generate_travel_guide(origin, destination)
    directions_data = MapquestService.get_directions(origin, destination)
    TravelGuide.new(directions_data)
  end

  def self.generate_road_trip_data(origin, destination)
    travel_guide = generate_travel_guide(origin, destination)
    destination_forecast = ForecastFacade.generate_forecast_by_travel_guide(travel_guide)
    {
      origin: origin,
      destination: destination,
      travel_guide: travel_guide,
      forecast: destination_forecast
    }
  end
end
