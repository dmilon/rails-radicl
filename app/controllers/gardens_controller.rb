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

  def stats
    @garden = Garden.find(params[:id])
    @zones = @garden.zones

    #charts1 - by zone
    @chart1_labels = []
    @data1 = []
    @zones.each do |zone|
      @sum = 0
      @chart1_labels << zone.name
      zone.elements.each do |element|
        @sum += element.logs.count
      end
      @data1 << @sum
    end
    # @chart1_labels = ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"]
    @chart1_datasets = [{
      label: '# of logs by zones',
      data: @data1,
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      borderColor: 'rgba(255,99,132,1)',
      borderWidth: 1
    }]

    #chart2 - by elements
    @chart2_labels = []
    @data2 = []
    @zones.each do |zone|
      zone.elements.each do |element|
        @sum = 0
        @chart2_labels << element.name
        @sum += element.logs.count
        @data2 << @sum
      end
    end

    @chart2_datasets = [{
      label: '# of logs by elements',
      data: @data2,
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      borderColor: 'rgba(255,99,132,1)',
      borderWidth: 1
    }]

    #chart3 - by category
    @chart3_labels = []
    @data3 = []
    @logs_by_garden = @garden.logs.group(:category).count
    @chart3_labels = @logs_by_garden.keys
    @data3 = @logs_by_garden.values

    @chart3_datasets = [{
      label: '# of logs by category',
      data: @data3,
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      borderColor: 'rgba(255,99,132,1)',
      borderWidth: 1
    }]

    @chart4_labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'December']
    @logs_by_garden_by_month = @garden.logs.group(:created_at).count
    @data4 = @logs_by_garden_by_month.values
    @chart4_datasets = [{
      label: '# of logs by month',
      data: @data4,
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      borderColor: 'rgba(255,99,132,1)',
      borderWidth: 1
    }]
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def params_garden
    params.require(:garden).permit(:area, :photo, :name, :address)
  end
end
