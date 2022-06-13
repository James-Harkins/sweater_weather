class TravelGuideFacade
  def self.generate_travel_guide(origin, destination)
    directions_data = MapquestService.get_directions(origin, destination)
    TravelGuide.new(directions_data)
  end
end
