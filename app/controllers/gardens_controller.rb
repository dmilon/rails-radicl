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
    @zones.each do |zone|
      @sum = 0
      @chart1_labels << zone.name
      zone.elements.each do |element|
        @sum += element.logs.count
      end
      @chart1_data1 << @sum
    end

    # if current_user.follows.exists?
    #   @chart1_data2 = []
    #   @users_followed = current_user.follows
    #   @users_followed.each do |user_followed|
    #     @garden = user_followed.garden
    #     @zones = @garden.zones
    #   # pour chauqe user_followed, pour chacunes de ses zones, je compte les logs par categorie
    #     @zones.each do |zone|
    #       zone.logs.group(:category).count
    #     end
    #   # je regroupe pour tous les users_followed les categories des logs
    #   # je fais des moyennes selon s'ils ont fait ces categories
    #   # j'ordonne selon les labels

    #     @chart1_labels.each do |chart1_label|
    #       # waiting
    #       if chart1_label ==
    #       end
    #     end
    #     @elements = @garden.elements
    #   end


    # @chart1_labels = ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"]
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
    @chart2_labels = []
    @chart2_datasets = []
    @data_serie_elements = {}
    i = 0
    @garden.elements.each do |element|
      @element_name = element.name
      @chart2_labels << @element_name
      if element.logs == []
        @data_serie_elements[@element_name] = 0
      else
        @data_serie_elements[@element_name] = element.logs.group(:category).count
      end
    end

    @actions = [
     "preparing soil",
     "fertilisating soil",
     "sowing",
     "transplanting",
     "watering",
     "weeding",
     "mulching",
     "protecting and taking care of crops",
     "carrying",
     "cleaning",
     "conditionning and selling",
     "others"]
    @preparing_soil = []
    @fertilisating_soil = []
    @sowing = []
    @transplanting = []
    @watering = []
    @weeding = []
    @mulching = []
    @protecting_and_taking_care_of_crops = []
    @carrying = []
    @cleaning = []
    @conditionning_and_selling = []
    @others = []

    @data_serie_elements.values.each do |data_serie_logs|
      if data_serie_logs == 0
        @preparing_soil << 0
        @fertilisating_soil << 0
        @sowing << 0
        @transplanting << 0
        @watering << 0
        @weeding << 0
        @mulching << 0
        @protecting_and_taking_care_of_crops << 0
        @carrying << 0
        @cleaning << 0
        @conditionning_and_selling << 0
        @others << 0
      else
        data_serie_logs.each do |k, v|
          if k == "preparing soil"
            @preparing_soil << v
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << 0
            @watering << 0
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "fertilisating soil"
            @preparing_soil << 0
            @fertilisating_soil << v
            @sowing << 0
            @transplanting << 0
            @watering << 0
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "sowing"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << v
            @transplanting << 0
            @watering << 0
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "transplanting"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << v
            @watering << 0
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "watering"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << 0
            @watering << v
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "weeding"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << 0
            @watering << 0
            @weeding << v
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "mulching"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << 0
            @watering << 0
            @weeding << 0
            @mulching << v
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "protecting and taking care of crops"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << 0
            @watering << 0
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << v
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "carrying"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << 0
            @watering << 0
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << v
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "cleaning"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << 0
            @watering << 0
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << v
            @conditionning_and_selling << 0
            @others << 0
          end
          if k == "conditionning and selling"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << 0
            @watering << 0
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << v
            @others << 0
          end
          if k == "others"
            @preparing_soil << 0
            @fertilisating_soil << 0
            @sowing << 0
            @transplanting << 0
            @watering << 0
            @weeding << 0
            @mulching << 0
            @protecting_and_taking_care_of_crops << 0
            @carrying << 0
            @cleaning << 0
            @conditionning_and_selling << 0
            @others << v
          end
        end
      end
    end

     @color = 125
     @actions.each do |action|
      hash_new = {}
      hash_new[:label] = action
      if action == "preparing soil"
        hash_new[:data] = @preparing_soil
      elsif action == "fertilisating soil"
        hash_new[:data] = @fertilisating_soil
      elsif action == "sowing"
        hash_new[:data] = @sowing
      elsif action == "transplanting"
        hash_new[:data] = @transplanting
      elsif action == "watering"
        hash_new[:data] = @watering
      elsif action == "weeding"
        hash_new[:data] = @weeding
      elsif action == "mulching"
        hash_new[:data] = @mulching
      elsif action == "protecting and taking care of crops"
        hash_new[:data] = @protecting_and_taking_care_of_crops
      elsif action == "carrying"
        hash_new[:data] = @carrying
      elsif action == "cleaning"
        hash_new[:data] = @cleaning
      elsif action == "conditionning and selling"
        hash_new[:data] = @conditionning_and_selling
      else action == "others"
        hash_new[:data] = @others
      end

      @color += 10
      hash_new[:backgroundColor] = 'rgba(#{@color}, 99, 132, 0.2)'
      hash_new[:borderColor] = 'rgba(#{@color},99,132,1)'
      hash_new[:borderWidth] = 1
      @chart2_datasets << hash_new
     end

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

    #chart by dates

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
