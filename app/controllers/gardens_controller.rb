class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = " \
        gardens.name ILIKE :query \
        OR gardens.address ILIKE :query \
        OR users.name ILIKE :query \
      "
      @gardens = policy_scope(Garden).joins(:users).where(sql_query, query: "%#{params[:query]}%")
    else
      @gardens = policy_scope(Garden).all.order(name: :desc)
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
    @product = Product.new
    respond_to do |format|
      format.html
      format.js
    end
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
    authorize @garden
    @users = @garden.users
    @zones = @garden.zones
    @log = Log.new
    if params[:query].present?
      sql_query = " \
        logs.category ILIKE :query \
        OR logs.description ILIKE :query \
        OR elements.name ILIKE :query \
        OR zones.name ILIKE :query \
      "
      @logs = @garden.logs.joins(elements: :zone).where(sql_query, query: "%#{params[:query]}%")
    else
      @logs = @garden.logs.order(date: :desc)
    end
    respond_to do |format|
      format.html
      format.js
    end
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
      sum = sum.fdiv(current_user.follows.count)
      @chart1_data2 << sum
      end
    end

    @chart1_datasets = [{
      label: 'Ma ferme',
      data: @chart1_data1,
      backgroundColor: '#4db53c',
      borderColor: '#4db53c',
      borderWidth: 1
    }, {
      label: 'Ma communauté (moyenne)',
      data: @chart1_data2,
      backgroundColor: '#336CBC',
      borderColor: '#336CBC',
      borderWidth: 1
    }
    ]

    #chart3 - by category
     @chart3_labels = [
       "Labourage",
       "Fertilisation",
       "Semis",
       "Repiquage",
       "Arrosage",
       "Désherbage",
       "Paillage",
       "Protection",
       "Récolte",
       "Nettoyage",
       "Distribution",
       "Autres"
     ]

    # @chart3_labels = [
    #   "preparing soil",
    #   "fertilisating",
    #   "sowing",
    #   "transplanting",
    #   "watering",
    #   "weeding",
    #   "mulching",
    #   "caring crops",
    #   "carrying",
    #   "cleaning",
    #   "sharing",
    #   "others"
    # ]

    # @data3_1 = [5, 5, 2, 1, 1, 0, 0, 1, 0, 0, 0, 0]
    # @data3_2 = [6, 6, 6, 5, 0, 1, 0, 3, 0, 0, 0, 0]

    @chart3_data1 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    hash = @garden.logs.group(:category).count
    hash.each do |k, v|
      @chart3_data1[@chart3_labels.find_index(k)] += v
    end

    @chart3_data2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    current_user.follows.each do |follow|
      hash = follow.garden.logs.group(:category).count
      hash.each do |k,v|
        @chart3_data2[@chart3_labels.find_index(k)] += v
      end
    end
    @chart3_data2.map do |element|
      element.fdiv(current_user.follows.count)
    end

    @chart3_datasets = [{
      label: 'Ma ferme',
      data: @chart3_data1,
      backgroundColor: 'rgba(77, 181, 60, 0.2)',
      borderColor: '#4db53c',
      borderWidth: 1
    },
    {
      label: 'Ma communauté (moyenne)',
      data: @chart3_data2,
      backgroundColor: 'rgba(51, 108, 188, 0.2)',
      borderColor: '#336CBC',
      borderWidth: 1
    },
  ]
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def params_garden
    params.require(:garden).permit(:area, :photo, :name, :address)
  end
end
