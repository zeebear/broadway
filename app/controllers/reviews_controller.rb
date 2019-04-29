class ReviewsController < ApplicationController
  before_action :set_play, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.play = @play
    @review.user = current_user

    rediretc_to play_path(@play) if @review.save
    return

    render 'new'
  end

  private

  def set_play
    @play = Play.find(params[:play_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
