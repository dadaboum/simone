class SurgeriesController < ApplicationController

  def show
    @surgery = Surgery.find(params[:id])
    @surgeries = current_user.hospital.surgeries
  end

end
