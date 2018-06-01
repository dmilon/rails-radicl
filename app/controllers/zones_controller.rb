class ZonesController < ApplicationController
  before_action :set_zone, only: [:show, :edit, :update, :destroy]

  def new
    @garden = Garden.find(params[:garden_id])
    @zone = Zone.new
    authorize @zone
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @zone = Zone.new(zone_params)
    @zone.garden = @garden
    authorize @zone
    if @zone.save
      redirect_to new_zone_element_path(@zone)
    else
      render :new
    end
  end

  def show
    authorize @zone
    @zone = Zone.find(params[:id])
    @garden = @zone.garden
    @log = Log.new
    @elements = Element.all
    @log_scopes = LogScope.all
  end

  def edit
    authorize @zone
    @garden = @zone.garden
  end

  def update
    authorize @zone
    @zone.update(zone_params)
    redirect_to zone_path(@zone)
  end

  def destroy
    authorize @zone
    @zone.destroy
    redirect_to garden_path(@zone.garden)
  end

  private

  def set_zone
    @zone = Zone.find(params[:id])
  end

  def zone_params
    params.require(:zone).permit(:name, :area, :photo, :garden_id)
  end
end
