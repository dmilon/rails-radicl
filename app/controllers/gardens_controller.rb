class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

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
    @logs = Log.all
    @zones = @garden.zones
    @log = Log.new
  end

  def edit
  end

  def update
    @garden.update(params_garden)
    redirect_to garden_path(@garden)
  end

  def destroy
    @garden.destroy
    redirect_to root_path
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def params_garden
    params.require(:garden).permit(:area, :photo, :name, :address)
  end
end
