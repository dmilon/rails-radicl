require 'date'
class ActionsController < ApplicationController

  def index
    @actions = Action.all
  end

  def create
    #@garden = Garden.find(params[:garden_id])
    # authorize @garden
    # authorize @zone
    @actions = Action.all
    @action = Action.new(action_params)
    @action.user = current_user
    @action.date = Date.parse(params[:action][:date])
    if @action.date < Date.today
      @action.status = true
    else
      @action.status = false
    end

    if params[:action][:zones].blank?
      # if blank, I came from one zones/:id
      # @zone = Zone.find(params[:zone_id])
      authorize @action
      if @action.save
        @element_id = params[:action][:elements][:name]
        # LogScope.create(action_id: @action.id, element_id: @element_id.to_i)
        redirect_to farm_path(current_user.farm)
      else
        @elements = Element.all
        # @log_scopes = LogScope.all
        render "zones/show"
      end
    # else
      # Else It means I came from gardens/:id
      # authorize @log
      # if @log.save
      #   log_id =  @log.id
      #   params[:log][:zones][:name].each do |zone_id|
      #     unless zone_id == ""
      #       @zone = Zone.find(zone_id.to_i)
      #       @zone.elements.ids.each do |id|
      #         LogScope.create(log_id: log_id, element_id: id)
      #       end
      #     end
      #   end
      #   redirect_to garden_path(current_user.garden)
      # else
      #   render "gardens/show"
      # end
    end
  end

  def update
    @farm = current_user.farm
    @log = Action.find(params[:id])
    authorize @log
    @action.status = !@action.status
    @action.save<
    respond_to do |format|
      format.html { redirect_to farm_path(current_user.farm) }
      format.js do
        @actions = @farm.logs.order(date: :desc).order(created_at: :desc)
      end
    end
  end

  private

  def action_params
    params.require(:action).permit(:status, :date, :description, :quantity, :category, :user_id)
  end

  def action_scope_params
    params.require(:log_scope).permit(:element_id, :action_id)
  end
end
