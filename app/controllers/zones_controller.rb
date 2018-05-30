class ZonesController < ApplicationController
  def new
    @garden = Garden.find(params[:garden_id])
    @zone = Zone.new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @zone = Zone.new(zone_params)
    @zone.garden = @garden
    if @zone.save
      redirect_to new_zone_element_path(@zone)
      # en attente de la route du formulaire new_element
      # redirect_to new_zone_element_path
    else
      render :new
    end
  end

  def show
    @zone = Zone.find(params[:id])
    @elements = Element.all
    @log_scopes = LogScope.all
  end

  private

  def zone_params
    params.require(:zone).permit(:name, :area, :photo, :garden_id)
  end
end
