class VenuesController < ApplicationController
  before_action :find_venue, only: [:show]
  def index
    @venues = policy_scope(Venue).order(created_at: :desc)
    all_venues = Venue.all
    @ratings_by_venue = all_venues.map do |venue|
      if venue.reviews.empty?
        []
      else
        venue.reviews.map { |review| review.rating }
      end
    end
  end

  def show
    authorize @venue
  end

  private

  def find_venue
    @venue = Venue.find(params[:id])
  end
end
