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

  def create
    new_round = Round.new(round_params)
    if new_round.save
      render json: new_round, status: :accepted
    else
      render json: { errors: new_round.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def round_params
    params.permit(:score)
  end

  def find_round
    @round = Round.find(params[:id])
  end
end
