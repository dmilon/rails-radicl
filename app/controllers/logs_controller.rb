class LogsController < ApplicationController

  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
    @log_scope = LogScope.new
  end

  def create
    @log = Log.new(params_log)

  end

  private

  def params_log
    params.require(:log).permit(:category, :date, :status, :description, :quantity)
  end
end
