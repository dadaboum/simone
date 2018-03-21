class SurgeriesController < ApplicationController

  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
  end




  def pre_op_yellow_flag
  end

  def pre_op_green_fag
  end
end
