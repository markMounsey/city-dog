class VenuetagsController < ApplicationController
  def create
    @venue = Venue.find(params[:venue_id])
    @venuetag = Venuetag.new(params_ventag)
    @venuetag.venue = @venue
    if @venuetag.save
      redirect_to venue_path(@venue)
    else
      render 'venues/show'
    end
  end

  private

  def params_ventag
    params.require(:venuetag).permit(:tag_id)
  end
end
