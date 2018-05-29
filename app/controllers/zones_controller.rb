class ZonesController < ApplicationController
  def new
    @garden = Garden.find(params[:garden_id])
    @zone = Zone.new
  end

  def create
    @zone = Zone.new(zone_params)
    @garden = Garden.find(params[:garden_id])
    @zone.garden = @garden
    if @zone.save
      redirect_to garden_path(@garden)
      # en attente de la route du formulaire new_element
      # redirect_to new_zone_element_path
    else
      render :new
    end
  end

  private

  def zone_params
    params.require(:zone).permit(:name, :area, :photo, :garden_id)
  end
end
