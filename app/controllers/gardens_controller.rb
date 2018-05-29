class GardensController < ApplicationController
  def new
    @garden = Garden.new
  end

  def create
  end
end
