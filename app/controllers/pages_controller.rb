class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @garden = current_user.garden
  end

end
