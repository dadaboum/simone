class SurgeonsController < ApplicationController
  def notice
    @surgery = Surgery.find(params[:surgery_id])
    @patient = @surgery.patient
    @surgeon = @surgery.surgeon
    @events = Event.where("surgery_id=?", @surgery.id).order(created_at: :DESC)
    SurgeonMailer.notice(@surgeon, @patient, @events).deliver_now
    flash[:notice] = 'Le mail a bien été envoyé'
    redirect_to surgeries_path(status: params[:status], surgery_id: params[:surgery_id], pre_or_post: params[:pre_or_post])
  end
end
