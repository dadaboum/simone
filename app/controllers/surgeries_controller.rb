class SurgeriesController < ApplicationController
before_action :set_surgery, only: [:show, :update]

  def index
    @surgeries = set_surgeries_filters_and_order

    if params[:query].present?
      selection = PgSearch.multisearch(params[:query])
      @surgeries = selection.map(&:searchable).map(&:surgeries).flatten
    end
    
    if params[:surgery_id].present?
      @surgery = Surgery.find(params[:surgery_id])
    else
      @surgery = @surgeries.first
    end

    @status_array = ["alerte", "à vérifier", "ok", "non répondu"]
    @event = Event.new
    @events = @surgery.events.order(created_at: :asc) if @surgery

    respond_to do |format|
      format.html
      format.js
    end
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
    @status_array = ["alerte", "à vérifier", "ok", "non répondu"]
    @surgery = Surgery.find(params[:id])
    @event = Event.new
    @event.surgery = @surgery

    # case 1 : when clicking on the validate button
    if params[:todo].present?
      if params[:todo] == "validate"
        @surgery.validated = true
        @event.description = "Fiche validée"
        @event.flag = "green"
      elsif params[:todo] == "unvalidate"
        @surgery.validated = false
        @event.description = "Fiche dévalidée"
        @event.flag = "orange"
      end
      @event.description = @event.description + " par " + current_user.first_name + " " + current_user.last_name
      @event.save!
      @surgery.save!
      # set instances for index and redirect
      @events = @surgery.events.order(created_at: :asc)
      @surgeries = set_surgeries_filters_and_order
      respond_to do |format|
        format.html { redirect_to surgeries_path(surgery_id: @surgery.id) }
        format.js {render action: "index"}
      end

    # case 2 : when updating priority
    elsif params[:change_status].present?
      if params[:change_status] == "Alerte"
      @surgery.status = "alerte"
      @event.description = "a changé la priorité à 'Alerte'"
      @event.flag = "red"
      elsif params[:change_status] == "A vérifier"
      @surgery.status = "à vérifier"
      @event.description = "a changé la priorité à 'A vérifier'"
      @event.flag = "orange"
      elsif params[:change_status] == "Ok"
      @surgery.status = "ok"
      @event.description = "a changé la priorité à 'Ok"
      @event.flag = "green"
      elsif params[:change_status] == "Non répondu"
      @surgery.status = "non répondu"
      @event.description = "a changé la priorité à 'Non répondu'"
      @event.flag = "grey"
      end
      @event.description = current_user.first_name + " " + current_user.last_name + " " + @event.description
      @event.save!
      @surgery.save!
      # set instances for index and redirect
      @events = @surgery.events
      @surgeries = set_surgeries_filters_and_order
      respond_to do |format|
        format.html { redirect_to surgeries_path(surgery_id: @surgery.id) }
        format.js {render action: "index"}
      end

    # case 3 : when adding an event
    elsif event_params
      @event.update(event_params)
      @event.save!
      # set instances for index and redirect (only update the right-side)
      @events = @surgery.events
      @surgeries = set_surgeries_filters_and_order
      respond_to do |format|
        format.html { redirect_to surgeries_path(surgery_id: @surgery.id) }
        format.js
      end

    # case 4 : when adding a comment from the form show
    elsif surgery_params[:pre_comments].present? || surgery_params[:post_comments].present?
    @event.description = "Commentaire pré-opératoire : " + surgery_params[:pre_comments] if surgery_params[:pre_comments]
    @event.description = "Commentaire post-opératoire : " + surgery_params[:post_comments] if surgery_params[:post_comments]
    @event.save
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

  def set_surgeries_filters_and_order
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

    #a = @surgeries.where(status: "alerte", validated: false)
    #b = @surgeries.where(status: "à vérifier", validated: false)
    #c = @surgeries.where(status: "ok", validated: false)
    #d = @surgeries.where(status: "non répondu", validated: false)
    #e = @surgeries.where(status: "alerte", validated: true)
    #f = @surgeries.where(status: "à vérifier", validated: true)
    #g = @surgeries.where(status: "ok", validated: true)
    #h = @surgeries.where(status: "non répondu", validated: true)
    #@surgeries = a + b + c + d + e + f + g + h

    if params[:query].present?
      selection = PgSearch.multisearch(params[:query])
      @surgeries = []
      selection.each do |pg|
        pg.searchable.surgeries.each { |surgery| @surgeries << surgery }
      end
    end
    return @surgeries
  end

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
