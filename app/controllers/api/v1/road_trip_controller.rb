class Api::V1::RoadTripController < ApplicationController
  def create
    request_params = JSON.parse(params["_json"], symbolize_names: true)
    if User.find_by(api_key: request_params[:api_key])
      travel_guide = TravelGuideFacade.generate_travel_guide(request_params[:origin], request_params[:destination])
      road_trip_data = {
        origin: request_params[:origin],
        destination: request_params[:destination],
        travel_guide: travel_guide
      }
      render json: RoadTripSerializer.serialize(road_trip_data), status: :created
    else
      render json: {error: "unauthorized"}, status: 401
    end
  end
end
