class PlayersController < ApplicationController

  def index
    render :index
  end

  def new
    @player = Player.new
    if request.xhr?
      render :new, layout: false
    else
      render :new
    end
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to root_path
    else
      render :new
    end
  end

  def player_params
    params.require(:player).permit(:name, :location, :pitches_faced, :hits, :innings, :date)
  end

end
