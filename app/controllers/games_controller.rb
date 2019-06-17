class GamesController < ApplicationController
  before_action :game_params, only: [:create]

  def index
    render json: Game.all
  end

  def create
    @game = Game.new game_params
    if @game.save
      render json: { payload: { data: @game } }, status: 200
    else
      render json: { payload: { errors: @game.errors } }, status: 422
    end
  end

  def destroy
    @game = Game.find params[:id]
    if @game.destroy
      render json: { payload: { data: @game } }, status: 200
    else
      render json: { payload: { errors: @game.errors } }, status: 422
    end
  end

  private
  def game_params
    params[:game].permit(:name)
  end
end
