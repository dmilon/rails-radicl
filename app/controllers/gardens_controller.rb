class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
  end
end
