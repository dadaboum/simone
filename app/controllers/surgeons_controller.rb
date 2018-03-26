class SurgeonsController < ApplicationController
  def notice
    @surgery = Surgery.find(params[:surgery_id])
    @patient = @surgery.patient
    @surgeon = @surgery.surgeon
    @events = Event.where("surgery_id=?", @surgery.id)
    SurgeonMailer.notice(@surgeon, @patient, @events).deliver_now
  end
end
