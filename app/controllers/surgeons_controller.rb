class SurgeonsController < ApplicationController
  def notice
    @surgeon = Surgery.find(params[:surgery_id]).surgeon
    SurgeonMailer.notice(@surgeon).deliver_now
  end
end
