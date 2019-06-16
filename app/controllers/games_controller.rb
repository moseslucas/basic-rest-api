class GamesController < ApplicationController
  before_action :game_params, only: [:create]

  def index
    render json: Game.all
  end

  def create
    @game = Game.new game_params
    if @game.save
      render json: @game
    end
  end

  def destroy
    @game = Game.find params[:id]
    if @game.destroy
      render json: @game
    end
  end

  private
  def game_params
    params[:game].permit(:name)
  end
end
