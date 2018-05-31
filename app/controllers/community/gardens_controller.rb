class Community::GardensController < ApplicationController

  def index
    @gardens = policy_scope(Garden).order(created_at: :desc)
  end
end
