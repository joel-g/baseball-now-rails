class PlayersController < ApplicationController

  def index
    render :index
  end

  def new
    @player = Player.new
    render :new
  end

end
