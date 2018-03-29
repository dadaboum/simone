class VisitorsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @visitor = Visitor.new(visitors_params)
    if @visitor.save
      flash[:notice] = 'Votre email a bien été enregistré'
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  private

  def visitors_params
    params.require(:visitor).permit(:email)
  end
end
