class Api::V1::RoundsController < ApplicationController
  before_action :find_round, only: [:update]
  def index
    @rounds = Round.all
    render json: @rounds
  end

  def update
    @round.update(round_params)
    if @round.save
      render json: @round, status: :accepted
    else
      render json: { errors: @round.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def character_params
    params.permit(:character, :seconds, :status, :score)
  end

  def find_round
    @round = Round.find(params[:id])
  end
end
