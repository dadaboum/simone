class SurgeriesController < ApplicationController
before_action :set_surgery, only: [:show, :update]

  def index
    @surgeries = current_user.hospital.surgeries.order("lower(patients.last_name)")
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

    if params[:validated].present?
      @surgeries = @surgeries.where(validated: params[:validated])
    end

    a = @surgeries.where(status: "alerte", validated: false)
    b = @surgeries.where(status: "à vérifier", validated: false)
    c = @surgeries.where(status: "ok", validated: false)
    d = @surgeries.where(status: "non répondu", validated: false)
    e = @surgeries.where(status: "alerte", validated: true)
    f = @surgeries.where(status: "à vérifier", validated: true)
    g = @surgeries.where(status: "ok", validated: true)
    h = @surgeries.where(status: "non répondu", validated: true)
    @surgeries = a + b + c + d + e + f + g + h

    if params[:surgery_id].present?
      @surgery = Surgery.find(params[:surgery_id])
    else
      @surgery = @surgeries.first
      params[:surgery_id] = @surgery.id
    end

    @status_array = ["alerte", "à vérifier", "ok", "non répondu"]
    @event = Event.new
    @events = @surgery.events.order(created_at: :asc)
  end

  def show
    @surgery = Surgery.find(params[:id])
    @events = @surgery.events.order(created_at: :asc)

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
    @event = Event.new
  end

  def update
    @surgery = Surgery.find(params[:id])
    event = Event.new

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
      @surgery.status = "alerte" if params[:change_status] == "Alerte"
      @surgery.status = "à vérifier" if params[:change_status] == "A vérifier"
      @surgery.status = "ok" if params[:change_status] == "Ok"
      @surgery.status = "non répondu" if params[:change_status] == "Non répondu"
      @surgery.save!
      redirect_to surgeries_path(surgery_id: @surgery.id)

    #when adding an event
    elsif event_params
      event.update(event_params)
      event.surgery = @surgery
      event.save!
      redirect_to surgeries_path(surgery_id: @surgery.id)

    #when adding a comment
    else
    event.description = "Commentaire pré-opératoire : " + surgery_params[:pre_comments] if surgery_params[:pre_comments]
    event.description = "Commentaire post-opératoire : " + surgery_params[:post_comments] if surgery_params[:post_comments]
    event.surgery = @surgery
    event.save
    @surgery.update(surgery_params)
    redirect_to surgery_path(@surgery)
    end
  end

  def update_batch
    ids = params[:surgery_ids]
    ids.split(",").each do |id|
      surgery = Surgery.find(id)
      if params[:todo] == "validate"
        surgery.validated = true
      elsif params[:todo] == "prioritize"
        surgery.status = params[:status]
      end
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

  def event_params
    params.require(:event).permit(:flag, :description)
  end
end
