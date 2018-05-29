class ElementsController < ApplicationController
  def new
    @zone = Zone.find(params[:zone_id])
    @element = Element.new
  end

  def create
    @element = Element.new(element_params)
    @zone = Zone.find(params[:zone_id])
    @element.zone = @zone
    if @element.save
      redirect_to garden_path(@zone.garden_id)
    else
      render :new
    end
  end

  private

  def element_params
    params.require(:element).permit(:name, :quantity, :photo, :zone_id)
  end
end
