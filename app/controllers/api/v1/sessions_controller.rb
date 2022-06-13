class Api::V1::SessionsController < ApplicationController
  def create
    user_params = JSON.parse(params["_json"], symbolize_names: true)
    user = User.find_by(email: user_params[:email])
    if user&.authenticate(user_params[:password])
      render json: UsersSerializer.new(user)
    else
      render json: {error: "Invalid credentials."}, status: 400
    end
  end
end
