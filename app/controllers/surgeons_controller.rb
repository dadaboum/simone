class SurgeonsController < ApplicationController
  def notice
    @surgery = Surgery.find(params[:surgery_id])
    @patient = @surgery.patient
    @surgeon = @surgery.surgeon
    @events = Event.where("surgery_id=?", @surgery.id)
    SurgeonMailer.notice(@surgeon, @patient, @events).deliver_now
    redirect_to surgeries_path(status: params[:status], surgery_id: params[:surgery_id], pre_or_post: params[:pre_or_post])
  end
end
