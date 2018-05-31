class ElementsController < ApplicationController
  before_action :set_element, only: [:edit, :update, :destroy]

  def index
    @elements = Element.all
  end

  def new
    @element = Element.new
    @zone = Zone.find(params[:zone_id])
    @garden = @zone.garden
  end

  def create
    @element = Element.new(element_params)
    @zone = Zone.find(params[:zone_id])
    @element.zone = @zone
    if @element.save
      redirect_to zone_path(@zone)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @element.update(element_params)
    redirect_to zone_path(@element.zone)
  end

  def destroy
    @element.destroy
    redirect_to zone_path(@element.zone)
  end

  private

  def set_element
    @element = Element.find(params[:id])
  end

  def set_zone
    @zone = Zone.find(params[:zone_id])
  end

  def element_params
    params.require(:element).permit(:name, :quantity, :photo, :zone_id)
  end
end
