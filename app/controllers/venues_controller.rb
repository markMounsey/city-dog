class VenuesController < ApplicationController
  def index
    @venues = policy_scope(Venue).order(created_at: :desc).includes(:tag)
  end


end
