class FarmsController < ApplicationController
  before_action :set_farm, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = " \
        farms.name ILIKE :query \
        OR farms.address ILIKE :query \
        OR users.name ILIKE :query \
      "
      @farms = policy_scope(Farm).joins(:users).where(sql_query, query: "%#{params[:query]}%")
    else
      @farms = policy_scope(Farm).all.order(name: :desc)
    end
    @markers = @farms.map do |farm|
      {
        lat: farm.latitude,
        lng: farm.longitude,
        infoWindow: { content: render_to_string(partial: "/farms/info_window", locals: { farm: farm }) }
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
    @farm = Farm.new
    authorize @farm
  end

  def create
    @farm = Farm.new(params_farm)
    @user = current_user
    @user.farm = @farm
    @farm.users << @user
    authorize @farm
    if @farm.save
      #TODO: Faire passer user.admin à true
      redirect_to farm_path(@farm)
    else
      render :new
    end
  end

  def show
    @farm = Farm.find(params[:id])
    authorize @farm
    @users = @farm.users
    @zones = @farm.zones
    @action = Action.new
    if params[:query].present?
      sql_query = " \
        actions.category ILIKE :query \
        OR actions.description ILIKE :query \
        OR elements.name ILIKE :query \
        OR zones.name ILIKE :query \
      "
      @actions = @farm.actions.joins(elements: :zone).where(sql_query, query: "%#{params[:query]}%")
    else
      @actions = @farm.actions.order(date: :desc)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    authorize @farm
  end

  def update
    authorize @farm
    @farm.update(params_farm)
    redirect_to farm_path(@farm)
    authorize @farm
  end

  def destroy
    authorize @farm
    @farm.destroy
    redirect_to root_path
  end

  def stats
    @farm = Farm.find(params[:id])
    authorize @farm
    @zones = @farm.zones

    #charts1 - by zone
    @chart1_labels = []
    @chart1_data1 = []
    @chart1_data2 = []

    @zones.each do |zone|
      @chart1_labels << zone.name

      @sum = 0
      zone.elements.each do |element|
        @sum += element.actions.count
      end
      @chart1_data1 << @sum

      if current_user.follows.exists?
        sum = 0
        current_user.follows.each do |follow|
          follow.farm.zones.each do |follow_zone|
            if zone.name == follow_zone.name
              follow_zone.elements.each do |follow_element|
                sum += follow_element.actions.count
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
    hash = @farm.actions.group(:category).count
    hash.each do |k, v|
      @chart3_data1[@chart3_labels.find_index(k)] += v
    end

    @chart3_data2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    current_user.follows.each do |follow|
      hash = follow.farm.actions.group(:category).count
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

  def set_farm
    @farm = Farm.find(params[:id])
  end

  def params_farm
    params.require(:farm).permit(:area, :photo, :name, :address)
  end
end
