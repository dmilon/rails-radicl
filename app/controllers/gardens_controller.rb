class GardensController < ApplicationController

  def new
    @garden = Garden.new
  end

  def show
    @garden = Garden.find(params[:id])
    @logs = Log.all
  end
end
