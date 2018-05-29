class ElementsController < ApplicationController
  def new
    @element = Element.new(element_params)
    @zone = Zone.find(params[:zone_id])
  end

  def create
    @element = Element.new(element_params)
    @zone = Zone.find(params[:zone_id])
    @garden = Garden.find(params[:garden_id])
    if @element.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private

  def element_params
    params.require(:element).permit(:area, :photo)
  end
end
