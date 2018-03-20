class SurgeriesController < ApplicationController

  def index
    @surgeries = Surgery.all
  end

end
