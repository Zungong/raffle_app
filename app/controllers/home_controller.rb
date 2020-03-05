class HomeController < ApplicationController
  def index
    @odd_percentage = 1 / User.where(raffle: current_user.raffle).count.to_f * 100 if current_user
  end
end
