class ReviewsController < ApplicationController
  # before_action :find_review, only: [:create]
  def show
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @venue = Venue.find(params[:venue_id])
    @review.venue = @venue
    if @review.save
      redirect_to review_path(:venue_id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :photo, :user_id, :venue_id)
  end
end
