class ReviewsController < ApplicationController
  before_action :set_play
  before_action :set_review, only: %i[edit update destroy]
  before_action :authenticate_user!, only: %i[new edit]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.play = @play
    @review.user = current_user

    redirect_to play_path(@play) if @review.save
    return

    render 'new'
  end

  def edit
  end

  def update
    redirect_to play_path(@play) if @review.update(review_params)
    return

    render 'edit'
  end

  def destroy
    @review.destroy
    redirect_to play_path(@play)
  end

  private

  def set_play
    @play = Play.find(params[:play_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
