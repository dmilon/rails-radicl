class FollowsController < ApplicationController
  def index
    @follows = Follow.all
    authorize @follows
  end

  def new
    @follow = Follow.new
    authorize @follow
  end

  def create
    @follow = Follow.new(user_id: params[:user_id], garden_id: params[:garden_id])
    @garden = Garden.find(params[:garden_id])
    authorize @follow
    if @follow.save
      redirect_to community_gardens_path
    else
      redirect_to community_gardens_path
    end

  end

  private

  # def follow_params
  #   params.require(:follow).permit(params[:user_id], params:[garden_id])
  # end
end
