class PlaysController < ApplicationController
  before_action :find_play, only: %i[show edit update destroy]

  def index
    if params[:category].blank?
      @plays = Play.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category])
      @plays = Play.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @play = Play.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @play = Play.new(play_params)
    @play.user = current_user
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
    params.require(:play).permit(:title, :description, :director, :category_id, :photo)
  end

  def find_play
    @play = Play.find(params[:id])
  end
end
