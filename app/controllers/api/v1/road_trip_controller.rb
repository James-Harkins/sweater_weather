class Api::V1::RoadTripController < ApplicationController
  def create
    if User.find_by(api_key: request_params["api_key"])
      road_trip_data = TravelGuideFacade.generate_road_trip_data(request_params["origin"], request_params["destination"])
      render json: RoadTripSerializer.serialize(road_trip_data), status: :created
    else
      render json: {error: "unauthorized"}, status: 401
    end
  end

  private

  def request_params
    params.permit("origin", "destination", "api_key")
  end
end
