require 'date'
class LogsController < ApplicationController

  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    @log.user = current_user
    @log.date = Date.new(params[:log]['date(1i)'].to_i, params[:log]['date(2i)'].to_i, params[:log]['date(3i)'].to_i)
    if @log.date == Date.today
      @log.status = true
    else
      @log.status = false
    end
    if @log.save
      @element_ids = params[:log][:element_ids]
      @element_ids.each do |element_id|
          LogScope.create(log_id: @log.id, element_id: element_id.to_i)
      end
      redirect_back fallback_location: root_path
    else
      @zone = Zone.find(params[:zone_id])

      render "zones/show"
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
