class MapquestFacade
  def self.get_latitude_and_longitutde(location)
    data = MapquestService.get_location_data(location)
    {lat: data[:results][0][:locations][0][:latLng][:lat],
     lon: data[:results][0][:locations][0][:latLng][:lng]}
  end
end
