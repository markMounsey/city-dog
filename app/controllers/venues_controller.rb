class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_venue, only: [:show]

  def index
    if params[:query].present?
      @venues = policy_scope(Tag).find_by_name(params[:query]).venues unless params[:query].empty?
    else
      @venues = policy_scope(Venue).order(created_at: :desc)
    end
    @tags = policy_scope(Tag).order(created_at: :desc)
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end
  end

  def show
    authorize @venue
    @markers = @venue.geocode.map do
      {
        lat: @venue.latitude,
        lng: @venue.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { venue: @venue })
      }
    end
    @venuetag = Venuetag.new
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
