require 'json'

class PlayersController < ApplicationController

  def index
    render :index
  end

  def show
    @player = Player.find(params[:id])
    render :show, layout: false
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
        render :index
      end
    end
  end

  def update
    @player = Player.find(params[:id])
    @player.update_attributes(comments_params)
    if request.xhr?
      render :json => { comments: @player.comments }
    else
      redirect_to root_path
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    redirect_to root_path
  end

  def player_data
    response = []
    Player.all.each do |player|
      response << {
        name: player.name,
        color: 'rgba(119, 152, 191, .5)',
        data: [{ x: player.pitches_faced, y: player.hits }],
        url: "/players/#{player.id}",
      }
    end
    render :json => response
  end

  private

  def comments_params
    params.require(:player).permit(:comments)
  end

  def player_params
    if params[:player]
      params.require(:player).permit(:name, :location, :pitches_faced, :hits, :innings, :date)
    end
  end

end
