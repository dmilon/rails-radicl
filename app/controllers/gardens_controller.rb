class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @logs = Log.all
  end
end
