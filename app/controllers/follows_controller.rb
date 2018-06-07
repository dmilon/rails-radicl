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
    @gardens = Garden.all.order(name: :desc)
    @garden = Garden.find(params[:garden_id])
    @follow = Follow.find_by(user: current_user, garden: @garden)
    if @follow
      authorize @follow
      @follow.destroy
      respond_to do |format|
        format.html { redirect_to community_gardens_path }
        format.js
      end
    else
      @follow = Follow.new(user: current_user, garden: @garden)
      authorize @follow
      @follow.save
      respond_to do |format|
        format.html { redirect_to community_gardens_path }
        format.js
      end
    end
  end

  def update
    @garden = Garden.find(params[:id])
    @follow = Follow.find_by(user: current_user, garden: @garden)
    if @follow
      authorize @follow
      @follow.destroy
      respond_to do |format|
        format.html { redirect_to garden_path(@garden) }
        format.js
      end
    else
      @follow = Follow.new(user: current_user, garden: @garden)
      authorize @follow
      @follow.save
      respond_to do |format|
        format.html { redirect_to garden_path(@garden) }
        format.js
      end
    end
  end

  private

  # def follow_params
  #   params.require(:follow).permit(params[:user_id], params:[garden_id])
  # end
end
