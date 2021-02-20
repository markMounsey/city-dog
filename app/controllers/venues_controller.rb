class VenuesController < ApplicationController
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
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end
  end
end
