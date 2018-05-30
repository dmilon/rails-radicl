class LogsController < ApplicationController

  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(params_log)
    if @log.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  private

  def params_log
    params.require(:log).permit(:category, :date, :status, :description, :quantity)
  end
end
