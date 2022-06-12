class Api::V1::UsersController < ApplicationController
  def create
    user_params = JSON.parse(params["_json"], symbolize_names: true)
    user = User.new(user_params)
    if user.save
      render json: UsersSerializer.new(user), status: :created
    else
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    end
  end
end
