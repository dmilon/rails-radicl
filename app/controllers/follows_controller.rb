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
    # est-ce que le current_user follow ce garden
    @garden = Garden.find(params[:garden_id])
    @follow = Follow.find_by(user: current_user, garden: @garden)
    # si j'ai récupéré qq chose dans @follow -- déjà followed
    if @follow
      # unfollow
      authorize @follow
      @follow.destroy
      redirect_to community_gardens_path
    # sinon
    else
      # on crée le follow
      @follow = Follow.new(user: current_user, garden: @garden)
      authorize @follow
      if @follow.save
        redirect_to community_gardens_path
      else
        redirect_to community_gardens_path
      end
    end
  end

  private

  # def follow_params
  #   params.require(:follow).permit(params[:user_id], params:[garden_id])
  # end
end
