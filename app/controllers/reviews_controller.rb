class ReviewsController < ApplicationController
  def new
    @reviews = Review.new
  end

  # # def index
  # #   @reviews = Review.all
  # # end

  # def new
  #   @venue = Venue.find(params[:venue_id])
  #   @review = current_user.reviews.new
  #   authorize @review
  # end

  # def create
  # end

  # # def edit
  # # end

  # # def update
  # # end

  # # def destory
  # # end

  # private

  # def review_params
  #   params.require(:review).permit(:rating, :comment, :photo, :user_id, :venue_id)
  # end
end
