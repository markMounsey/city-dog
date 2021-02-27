class VenuesController < ApplicationController
  before_action :find_venue, only: [:show]
  def index
    @venues = policy_scope(Venue).order(created_at: :desc)
    @all_venues = Venue.all
    @ratings_by_venue = @all_venues.reverse.map do |venue|
      if venue.reviews.empty?
        []
      else
        venue.reviews.map { |review| review.rating }
      end
    end
    @markers = @all_venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end
  end

  def show
    authorize @venue
  end

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    authorize @venue
    if @venue.save
      redirect_to @venue, notice: "#{@venue.category.upcase} was successfully created."
    else
      render :new
    end
  end

  private

  def find_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :category, :description, :photos)
  end
end
