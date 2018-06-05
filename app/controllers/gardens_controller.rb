class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @gardens = policy_scope(Garden).order(created_at: :desc)
      @gardens = @gardens.where.not(latitude: nil, longitude: nil)
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @gardens = @gardens.where(sql_query, query: "%#{params[:query]}%")
    else
      @gardens = policy_scope(Garden).order(created_at: :desc)
    end
    @markers = @gardens.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude,
        infoWindow: { content: render_to_string(partial: "/gardens/info_window", locals: { garden: garden }) }
      }
    end

    @products = Product.all
    @users = User.all
  end


  def new
    @garden = Garden.new
    authorize @garden
  end

  def create
    @garden = Garden.new(params_garden)
    @user = current_user
    @user.garden = @garden
    @garden.users << @user
    authorize @garden
    if @garden.save
      #TODO: Faire passer user.admin à true
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def show
    @garden = Garden.find(params[:id])
    @users = @garden.users
    @logs = @garden.logs
    @zones = @garden.zones
    @log = Log.new
    authorize @garden
  end

  def edit
    authorize @garden
  end

  def update
    authorize @garden
    @garden.update(params_garden)
    redirect_to garden_path(@garden)
    authorize @garden
  end

  def destroy
    authorize @garden
    @garden.destroy
    redirect_to root_path
  end

  def stats
    @garden = Garden.find(params[:id])
    authorize @garden
    @zones = @garden.zones

    #charts1 - by zone
    @chart1_labels = []
    @chart1_data1 = []
    @chart1_data2 = []

    @zones.each do |zone|
      @chart1_labels << zone.name

      @sum = 0
      zone.elements.each do |element|
        @sum += element.logs.count
      end
      @chart1_data1 << @sum

      if current_user.follows.exists?
        sum = 0
        current_user.follows.each do |follow|
          follow.garden.zones.each do |follow_zone|
            if zone.name == follow_zone.name
              follow_zone.elements.each do |follow_element|
                sum += follow_element.logs.count
              end
            end
          end
        end
      end
      sum = sum.fdiv(current_user.follows.count)
      @chart1_data2 << sum
    end

    @chart1_datasets = [{
      label: '# of logs by zones',
      data: @chart1_data1,
      backgroundColor: 'rgba(255, 99, 132, 0.2)',
      borderColor: 'rgba(255,99,132,1)',
      borderWidth: 1
    }, {
      label: '# of logs by zones',
      data: @chart1_data2,
      backgroundColor: 'rgba(125, 99, 132, 0.2)',
      borderColor: 'rgba(125,99,132,1)',
      borderWidth: 1
    }
    ]

    #chart2 - by elements
    # @chart2_labels = []
    # @chart2_datasets = []
    # @data_serie_element = {}
    # i = 0
    # @garden.elements.each do |element|
    #   @element_name = element.name
    #   @chart2_labels << @element_name
    #   @data_serie_elements[:element_name] = element.logs.group(:category).count
    #   # element.logs.where(category:"sowing").count
    # end

    # @actions = [
    #  "preparing soil",
    #  "fertilisating soil",
    #  "sowing",
    #  "transplanting",
    #  "watering",
    #  "weeding",
    #  "mulching",
    #  "protecting and taking care of crops",
    #  "carrying",
    #  "cleaning",
    #  "conditionning and selling",
    #  "others" ]

    #  @actions.each do |action|
    #   @data_prep = {:label, :data, :backgroundColor, :borderColor, borderWidth: 1}
    #   @data_prep[:label] = action
    #   @data_serie_elements.each do |data_serie_element|
    #     # data_serie_element.
    #   end


    #  end


    # @chart2_datasets = [{
    #   label: '# of logs by elements',
    #   data: @data2,
    #   backgroundColor: 'rgba(255, 99, 132, 0.2)',
    #   borderColor: 'rgba(255,99,132,1)',
    #   borderWidth: 1
    # }]

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
    @logs_by_garden_by_month = { january: 0, february: 0, march: 0, april: 0, may: 0, june: 0, july: 0, august: 0, september: 0, october: 0, december: 0}
    @garden.logs.group(:created_at).count.each do |log_date|
      case
      when log_date[0].month == 1
        @logs_by_garden_by_month[:january] += 1
      when log_date[0].month == 2
        @logs_by_garden_by_month[:february] += 1
         when log_date[0].month == 3
        @logs_by_garden_by_month[:march] += 1
         when log_date[0].month == 4
        @logs_by_garden_by_month[:april] += 1
         when log_date[0].month == 5
        @logs_by_garden_by_month[:may] += 1
         when log_date[0].month == 6
        @logs_by_garden_by_month[:june] += 1
         when log_date[0].month== 7
        @logs_by_garden_by_month[:july] += 1
         when log_date[0].month == 8
        @logs_by_garden_by_month[:august] += 1
         when log_date[0].month == 9
        @logs_by_garden_by_month[:september] += 1
         when log_date[0].month == 10
        @logs_by_garden_by_month[:october] += 1
         when log_date[0].month == 11
        @logs_by_garden_by_month[:november] += 1
         when log_date[0].month == 12
        @logs_by_garden_by_month[:december] += 1
      end
    end
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
