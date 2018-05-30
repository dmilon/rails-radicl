class GardensController < ApplicationController

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(params_garden)
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def show
    @garden = Garden.find(params[:id])
    @logs = Log.all
    @zones = @garden.zones
    @log = Log.new
  end

  private

  def params_garden
    params.require(:garden).permit(:area, :photo, :name, :address)
  end
end
