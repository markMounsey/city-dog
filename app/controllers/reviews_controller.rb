class ReviewsController < ApplicationController
  # before_action :find_review, only: [:create]
  def new
    @venue = Venue.find(params[:venue_id])
    @review = Review.new
    authorize @review
  end

  def create
    # authorize @review
  end

  # private

  # def review_params
  #   params.require(:review).permit(:rating, :comment, :photo, :user_id, :venue_id)
  # end
end
