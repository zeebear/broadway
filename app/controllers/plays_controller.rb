class PlaysController < ApplicationController
  before_action :find_play, only: %i[show edit update delete]

  def index
    @plays = Play.all
  end

  def show
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)

    redirect_to root_path if @play.save
    return

    render 'new'
  end

  def edit
  end

  def update
    @play.update(play_params)

    redirect_to @play if @play.save
    return

    render 'edit'
  end

  def destroy

  end

  private

  def play_params
    params.require(:play).permit(:title, :description, :director)
  end

  def find_play
    @play = Play.find(params[:id])
  end
end
