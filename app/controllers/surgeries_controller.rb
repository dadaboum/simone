class SurgeriesController < ApplicationController

  def show
    @surgery = Surgery.find(params[:id])
  end

end
