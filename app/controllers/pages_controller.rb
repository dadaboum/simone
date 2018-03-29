class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
  end

  def home
    @visitor = Visitor.new
  end
end
