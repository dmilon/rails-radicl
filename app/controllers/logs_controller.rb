class LogsController < ApplicationController
  def new
    @log = Log.new
  end

  def index
    @logs = Log.all
  end
end
