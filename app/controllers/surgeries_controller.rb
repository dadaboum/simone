class SurgeriesController < ApplicationController
before_action :set_surgery, only: [:show, :update]

  def index
    @surgeries = current_user.hospital.surgeries
    if params[:surgery_id].present?
      @surgery = Surgery.find(params[:surgery_id])
    end

    if params[:status].present?
      @surgeries = @surgeries.where(status: params[:status])
    end

    if params[:pre_or_post].present?
      if params[:pre_or_post] == "pre"
        @surgeries = @surgeries.where("date > ?", Date.today)
      elsif params[:pre_or_post] == "post"
        @surgeries = @surgeries.where("date < ?", Date.today)
      end
    end
    @status_array = ["urgent", "à traiter", "ok", "non répondu"]
  end

  def show
    @surgery = Surgery.find(params[:id])
    @surgeries = current_user.hospital.surgeries
    if params[:status].present?
      @surgeries = @surgeries.where(status: params[:status])
      # redirect_to surgery_path(@surgeries.first)
    end
    # Return array of forms
    answers = FormAnswer.where(surgery_id: @surgery.id)
    answers.each do |answer|
      @pre_form_answer = answer if answer.form.pre_or_post == "pre"
      @post_form_answer = answer if answer.form.pre_or_post == "post"
    end
  end

  def update
    @surgery = Surgery.find(params[:id])

    #when clicking on the validate button
    if params[:todo].present?
      if params[:todo] == "validate"
        @surgery.validated = true
      elsif params[:todo] == "unvalidate"
        @surgery.validated = false
      end
      @surgery.save!
      redirect_to surgeries_path(surgery_id: @surgery.id)

    #when updating priority
    elsif params[:change_status].present?
      @surgery.status = "urgent" if params[:change_status] == "Urgent"
      @surgery.status = "à traiter" if params[:change_status] == "A traiter"
      @surgery.status = "ok" if params[:change_status] == "Ok"
      @surgery.status = "non répondu" if params[:change_status] == "Non répondu"
      @surgery.save!
      redirect_to surgeries_path(surgery_id: @surgery.id)



    #when adding a comment
    else
    event = Event.new
    event.description = "Commentaire pré-opératoire : " + surgery_params[:pre_comments] if surgery_params[:pre_comments]
    event.description = "Commentaire post-opératoire : " + surgery_params[:post_comments] if surgery_params[:post_comments]
    event.surgery = @surgery
    event.save
    @surgery.update(surgery_params)
    redirect_to surgery_path(@surgery)
    end
  end

  def validate_batch
    ids = params[:surgery_ids]
    ids.split(",").each do |id|
      surgery = Surgery.find(id)
      surgery.validated = true
      surgery.save
    end
    redirect_to surgeries_path
  end

  private

  def set_surgery
    @surgery = Surgery.find(params[:id])
  end

  def surgery_params
    params.require(:surgery).permit(:pre_comments, :post_comments, :validated)
  end
end
