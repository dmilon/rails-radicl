class GardensController < ApplicationController
  # def index
  #   @gardens = Garden.where.not(latitude: nil, longitude: nil)
  #   @markers = @flats.map do |flat|
  #     {
  #       lat: garden.latitude,
  #       lng: garden.longitude
  #     }
  # end

  def new
    @garden = Garden.new
  end

  def show
    @garden = Garden.find(params[:id])
    @logs = Log.all
  end
end
