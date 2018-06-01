class Community::GardensController < ApplicationController

  def index
    @gardens = policy_scope(Garden).order(created_at: :desc)
    @gardens = Garden.where.not(latitude: nil, longitude: nil)
    @markers = @gardens.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude
      }
    end
  end
end
