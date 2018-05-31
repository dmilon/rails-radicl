class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @gardens = Garden.where(sql_query, query: "%#{params[:query]}%")
    else
      @gardens = Garden.all
    end
  end

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
