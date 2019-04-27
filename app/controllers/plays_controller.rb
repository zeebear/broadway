class PlaysController < ApplicationController
  before_action :find_play, only: %i[show edit update destroy]

  def index
    @plays = Play.all.order('created_at DESC')
  end

  def show
  end

  def new
    @play = current_user.play.build
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @play = current_user.play.build(play_params)
    @play.category = params[:category_id]

    redirect_to root_path if @play.save
    return

    render 'new'
  end

  def edit
  end

  def update
    @play.category = params[:category_id]

    redirect_to @play if @play.update(play_params)
    return

    render 'edit'
  end

  def destroy
    @play.destroy
    redirect_to root_path
  end

  private

  def play_params
    params.require(:play).permit(:title, :description, :director, :category_id)
  end

  def find_play
    @play = Play.find(params[:id])
  end
end
