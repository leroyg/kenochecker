class GamesController < ApplicationController
  before_action :numbers_to_array, only: [:create]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new game_params
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def game_params
    params.require(:game).permit! # (:game_number, :game_date, :bonus, :numbers)
  end

  def numbers_to_array
    params[:game][:numbers] = params[:game][:numbers].split(',').map(&:to_i)
  end
end