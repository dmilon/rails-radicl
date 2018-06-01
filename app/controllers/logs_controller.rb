require 'date'
class LogsController < ApplicationController

  def index
    @logs = Log.all
  end

  def create
    #@garden = Garden.find(params[:garden_id])
    #authorize @garden
    # authorize @zone
    @logs = Log.all
    @log = Log.new(log_params)
    @log.user = current_user
    @log.date = Date.new(params[:log]['date(1i)'].to_i, params[:log]['date(2i)'].to_i, params[:log]['date(3i)'].to_i)
    if @log.date == Date.today
      @log.status = true
    else
      @log.status = false
    end

    if params[:log][:zones].blank?
      # if blank, I came from one zones/:id
      @zone = Zone.find(params[:zone_id])
      authorize @log
      if @log.save
        @element_ids = params[:log][:element_ids]
        @element_ids.each do |element_id|
            LogScope.create(log_id: @log.id, element_id: element_id.to_i)
        end
        if @zone.garden == current_user.garden
          redirect_to zone_path(@zone)
        end
      else
        @elements = Element.all
        @log_scopes = LogScope.all
        render "zones/show"
      end
    else
      # Else It means I came from gardens/:id
      authorize @log
      if @log.save
        log_id =  @log.id
        params[:log][:zones][:name].each do |zone_id|
          unless zone_id == ""
            @zone = Zone.find(zone_id.to_i)
            @zone.elements.ids.each do |id|
              LogScope.create(log_id: log_id, element_id: id)
            end
          end
        end
        redirect_to garden_path(current_user.garden)
      else
        render "gardens/show"
      end
    end
  end

  private

  def log_params
    params.require(:log).permit(:status, :date, :description, :quantity, :category, :user_id)
  end

  def log_scope_params
    params.require(:log_scope).permit(:element_id, :log_id)
  end
end
