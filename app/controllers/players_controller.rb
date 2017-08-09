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
    @error = false
    if params[:bulk]
      CSV.foreach(params[:bulk][:file].path) do |row|
        @player = Player.new(name: row[0], location: row[1], pitches_faced: row[2], hits: row[3], innings: row[4], date: row[5])
        if !@player.save
          @error = true
        end
      end
      render :index
    else
      @player = Player.new(player_params)
      if @player.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def player_params
    if params[:bulk]
      p 'yes bulk'
    else
      params.require(:player).permit(:name, :location, :pitches_faced, :hits, :innings, :date)
    end
  end

end
